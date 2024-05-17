
using { /Fortnite.com/Devices }

using { /Verse.org/Simulation }
using { /Verse.org/Assets }

using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }

GetNumberImage(Number : int):texture=
    if (Number = 0){ return Images.Zero }
    else if (Number = 1){ return Images.One }
    else if (Number = 2){ return Images.Two }
    else if (Number = 3){ return Images.Three }
    else if (Number = 4){ return Images.Four }
    else if (Number = 5){ return Images.Five }
    else if (Number = 6){ return Images.Six }
    else if (Number = 7){ return Images.Seven }
    else if (Number = 8){ return Images.Eight }
    else if (Number = 9){ return Images.Nine }
    return Images.Zero

IsIntegerInArray(Integer : int, IntegerArray : []int):int=
    for (I : IntegerArray):
        if (Integer = I):
            return 1
    return 0

SplitNumber(Number : int):[]int=
    <#
        Splits a number up into an array
        Example
        5432 -> {5,4,3,2}
    #>

    var Numbers : []int = array{}
    var Num : int = Number

    loop: 
        if (not Num > 0){ return Numbers }
        digit := Modulo(Num, 10)
        set Numbers += array{ digit }
        if (Value : int = Floor(Num / 10)):
            set Num = Value
       # set Num = Floor(Num / 10)

number_block := class(creative_device):
    var Number<public> : int = 0
    var RenderLength<public> : int = 2
    var Size<public> : float = 20.0
    var Numbers<private> : []texture_block = array{}

    GetTextureBlockArray():[]texture_block=
        return Numbers

    SetImageArray(TextureArray : []texture_block):void=
        set Numbers = TextureArray

    SetNumber():void=
        var NumbersList : []int = SplitNumber(Number)
        if (NumbersList.Length = 0 and Number = 0):
            set NumbersList += array{0}

        var IndexesBeingUsed : []int = array{}    
        
        # Set Images to correct number
        var Index : int = Numbers.Length - 1
        for (NumI : NumbersList):
            if (Image := Numbers[Index]):
                Image.SetImage(GetNumberImage(NumI))
                Image.SetVisibility(widget_visibility.Visible)
                set IndexesBeingUsed += array{Index}
            set Index -= 1
        
        # Hide Unused Images
        var ImageIndex : int = 0
        for (Image : Numbers):
            #BeingUsed : logic = IsIntegerInArray(ImageIndex, []IndexesBeingUsed)
            #if (not BeingUsed):
            var IsBeingUsed : int = IsIntegerInArray(ImageIndex, IndexesBeingUsed) # USING 0 and 1 for False, True because logic isnt working in if statements
            
            if (IsBeingUsed = 0):
                #Print("Hidding Image {ImageIndex}")
                Image.SetVisibility(widget_visibility.Hidden)

            set ImageIndex += 1

    RenderNumberImages():[]stack_box_slot=
        var StackBoxSlots : []stack_box_slot = array{}
        for (I := 1..RenderLength):
            var Image : texture_block = texture_block:
                DefaultImage := Images.Blank
                DefaultDesiredSize := vector2{X := Size, Y := Size}
            Image.SetVisibility(widget_visibility.Hidden)
            set Numbers += array{Image}

            set StackBoxSlots += array:
                stack_box_slot:
                    Widget := Image
        SetNumber()
        return StackBoxSlots

    GetNumberBlock():stack_box=
        return stack_box:
            Orientation := orientation.Horizontal 
            Slots := RenderNumberImages()

Fonts := enum:
    BrunoAce
    
dynamic_text_block := class():
    # Public Variables
    var Text <public> : string = ""
    var CharacterLength<public> : int = 25
    var Font<public> : Fonts = Fonts.BrunoAce
    var FontSize<public> : float = 20.0
    var Kerning<public> : float = 0.0

    # Private Variables
    var Characters<private> : []texture_block = array{}

    GetTextureBlockArray():[]texture_block=
        return Characters

    SetImageArray(TextureArray : []texture_block):void=
        set Characters = TextureArray

    GetCharacterImageByFont(Character : string)<transacts>:texture=
        if (Font = Fonts.BrunoAce):
            BrunoAceFont := BrunoAceFontManager{}
            #Print("{Character}")
            return BrunoAceFont.Get(Character)
        return Images.Blank

    SetText(TextString : string):void=
        var ActualText : string = TextString
        var IndexesBeingUsed : []int = array{}  

        if (ActualText = ""):
            set ActualText = Text

        for (I := 0..ActualText.Length):
            if (Char := ActualText[I]):
                if (Image := Characters[I]):
                    Image.SetImage(GetCharacterImageByFont("{Char}"))
                    Image.SetVisibility(widget_visibility.Visible)
                    set IndexesBeingUsed += array{I}
                    #Print("{Char}")

        for (I := 0..Characters.Length):
            var IsBeingUsed : int = IsIntegerInArray(I, IndexesBeingUsed) # USING 0 and 1 for False, True because logic isnt working in if statements
            
            if:
                IsBeingUsed = 0
                Image := Characters[I]
            then:
                Image.SetImage(Images.Blank)
                Image.SetVisibility(widget_visibility.Hidden)
             
    RenderCharacterImages():[]stack_box_slot=
        var StackBoxSlots : []stack_box_slot = array{}
        for (I := 1..CharacterLength):
            var Image : texture_block = texture_block:
                DefaultImage := Images.Blank
                DefaultDesiredSize := vector2{X := FontSize + Kerning, Y := FontSize}
            Image.SetVisibility(widget_visibility.Hidden)

            set Characters += array{Image}

            set StackBoxSlots += array:
                stack_box_slot:
                    Widget := Image
                    #Distribution := option{10.0}

        SetText()
        return StackBoxSlots

    GetDynamicTextBlock():stack_box=
        Slots := RenderCharacterImages()
        #Print("{Characters.Length} Characters")
        return stack_box:
            Orientation := orientation.Horizontal 
            Slots := Slots