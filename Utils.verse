
using { /Fortnite.com/Devices }

using { /Verse.org/Simulation }

using { /UnrealEngine.com/Temporary/Diagnostics }

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

GetPlayerName<localizes>(Agent:agent):message = "{Agent}"
StringToMessage<localizes>(String:string):message="{String}"