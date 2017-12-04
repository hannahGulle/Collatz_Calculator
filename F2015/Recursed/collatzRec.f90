program runCollatz

type collatz
        integer::start
        integer::length
end type

interface
subroutine getCollatz( start, seqSize )
        integer :: start
        integer :: seqSize
end subroutine getCollatz
end interface

type(collatz) :: c, temp
type(collatz), dimension(10000) :: allseq

integer :: seqSize
integer :: start, top
integer :: i,j

do 10 i=2, 10000, 1

        start = i
        seqSize = 0
        
        call getCollatz( start, seqSize )

        c = collatz( i, seqSize )
        allseq((i-1)) = c
10 continue

! Sort all collatz objects by collatz length
do i=2, size(allseq)
        j = i - 1
        temp = allseq(i)
        do while (j >= 1 .and. allseq(j)%length > temp%length)
                allseq(j+1) = allseq(j)
                j = j - 1
        end do
        allseq(j+1) = temp
end do

top = 1
do i=size(allseq), 1, -1
        if( allseq(i)%length > allseq(i-1)%length ) then
                print *, allseq(i)%start, allseq(i)%length
                top = top + 1
        end if
        if( top > 10 ) then
                EXIT
        end if

end do

end program runCollatz


recursive subroutine getCollatz( start, seqSize )
        integer :: start
        integer :: seqSize

        if( start /= 1 ) then  
                if ( mod( start, 2 ) == 0 ) then
                        start = start / 2
                        seqSize = seqSize + 1
                        call getCollatz( start, seqSize )
                else    
                        start = (3*start)+1
                        seqSize = seqSize + 1
                        call getCollatz( start, seqSize )
                endif
        endif
        
end subroutine getCollatz
