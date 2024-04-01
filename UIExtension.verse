
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

number_block := class(creative_device):
    var Number<public> : int = 0
    RenderLength<public> : int = 2
    Size<public> : float = 20.0
    var Numbers<private> : []texture_block = array{}

    SetNumber():void=
        var NumbersList : []int = SplitNumber(Number)
        if (NumbersList.Length = 0 and Number = 0):
            set NumbersList += array{0}
            
        var Index : int = Numbers.Length - 1
        for (NumI : NumbersList):
            if (Image := Numbers[Index]):
                Image.SetImage(GetNumberImage(NumI))
                Image.SetVisibility(widget_visibility.Visible)
            set Index -= 1

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