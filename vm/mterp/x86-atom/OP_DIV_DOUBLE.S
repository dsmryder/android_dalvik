   /* Copyright (C) 2008 The Android Open Source Project
    *
    * Licensed under the Apache License, Version 2.0 (the "License");
    * you may not use this file except in compliance with the License.
    * You may obtain a copy of the License at
    *
    * http://www.apache.org/licenses/LICENSE-2.0
    *
    * Unless required by applicable law or agreed to in writing, software
    * distributed under the License is distributed on an "AS IS" BASIS,
    * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    * See the License for the specific language governing permissions and
    * limitations under the License.
    */

   /*
    * File: OP_DIV_DOUBLE.S
    *
    * Code: Divides doubles. Uses no substitutions.
    *
    * For: div-double
    *
    * Description: Divide operation on two source registers, storing
    *              the result in a destination register
    *
    * Format: AA|op CC|BB (23x)
    *
    * Syntax: op vAA, vBB, vCC
    */

    FETCH_BB    1, %ecx                 # %ecx<- BB
    FETCH_CC    1, %edx                 # %edx<- CC
    fldl        (rFP, %ecx, 4)          # floating point stack vBB
    fdivl       (rFP, %edx, 4)          # divide double; vBB/vCC
    fstpl       (rFP, rINST, 4)         # vAA<- result
    FFETCH_ADV  2, %eax                 # %eax<- next instruction hi; fetch, advance
    FGETOP_JMP  2, %eax                 # jump to next instruction; getop, jmp
