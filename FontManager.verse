
using { /Fortnite.com/Devices }

using { /Verse.org/Simulation }
using { /Verse.org/Assets }

using { /UnrealEngine.com/Temporary/Diagnostics }

BrunoAceFontManager := class():
    Get(Character : string)<transacts>:texture=
        #return BrunoAce[Character]
        case (Character):
            # Numbers
            "0" => return BrunoAce.Zero
            "1" => return BrunoAce.One
            "2" => return BrunoAce.Two
            "3" => return BrunoAce.Three
            "4" => return BrunoAce.Four
            "5" => return BrunoAce.Five
            "6" => return BrunoAce.Six
            "7" => return BrunoAce.Seven
            "8" => return BrunoAce.Eight
            "9" => return BrunoAce.Nine

            # Letters
            "a" => return BrunoAce.a
            "A" => return BrunoAce.a_c
            "b" => return BrunoAce.b
            "B" => return BrunoAce.b_c
            "c" => return BrunoAce.c
            "C" => return BrunoAce.c_c
            "d" => return BrunoAce.d
            "D" => return BrunoAce.d_c
            "e" => return BrunoAce.e
            "E" => return BrunoAce.e_c
            "f" => return BrunoAce.f
            "F" => return BrunoAce.f_c
            "g" => return BrunoAce.g
            "G" => return BrunoAce.g_c
            "h" => return BrunoAce.h
            "H" => return BrunoAce.h_c
            "i" => return BrunoAce.i
            "I" => return BrunoAce.i_c
            "j" => return BrunoAce.j
            "J" => return BrunoAce.j_c
            "k" => return BrunoAce.k
            "K" => return BrunoAce.k_c
            "l" => return BrunoAce.l
            "L" => return BrunoAce.l_c
            "m" => return BrunoAce.m
            "M" => return BrunoAce.m_c
            "n" => return BrunoAce.n
            "N" => return BrunoAce.n_c
            "o" => return BrunoAce.o
            "O" => return BrunoAce.o_c
            "p" => return BrunoAce.p
            "P" => return BrunoAce.p_c
            "q" => return BrunoAce.q
            "Q" => return BrunoAce.q_c
            "r" => return BrunoAce.r
            "R" => return BrunoAce.r_c
            "s" => return BrunoAce.s
            "S" => return BrunoAce.s_c
            "t" => return BrunoAce.t
            "T" => return BrunoAce.t_c
            "u" => return BrunoAce.u
            "U" => return BrunoAce.u_c
            "v" => return BrunoAce.v
            "V" => return BrunoAce.v_c
            "w" => return BrunoAce.w
            "W" => return BrunoAce.w_c
            "x" => return BrunoAce.x
            "X" => return BrunoAce.x_c
            "y" => return BrunoAce.y
            "Y" => return BrunoAce.y_c
            "z" => return BrunoAce.z
            "Z" => return BrunoAce.z_c

            # Else
            _ => return BrunoAce.Blank