! Hannah Gulle
! Computes the top 10 starting values for a given user input range
! recursively for collatz sequences

! Main Program
program runCollatz

! c like struct to hold sequence start and sequence length
type collatz
        integer::start
        integer::length
end type

! collatz computational interface
interface
subroutine getCollatz( start, seqSize )
        integer :: start
        integer :: seqSize
end subroutine getCollatz
end interface

! holds collatz type objects for storage processes
type(collatz) :: c, temp
! dynamically allocated collatz type array holds all
! collatz objects
type(collatz), dimension(:), allocatable :: allseq
! holds the top 10 collatz types after sorting
type(collatz), dimension(10) :: topTen

integer :: endval       ! highest integer starting value
integer :: mem_stat     ! memory allocation error code

integer :: seqSize      ! size of current collatz sequence
integer :: start, top   ! starting values
integer :: i,j          ! iterative variables

write(*,*) "Input the Highest Starting Integer "
read(*,*) endval

! Allocate Collatz array for all collatz objects
allocate(allseq(endval), stat=mem_stat)
if(mem_stat /= 0) STOP "Memory Allocation Error"

! Determine and Construct the collatz object for each
! starting position and deposit into the collatz object
! array
do 10 i=2, endval, 1

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

write (*,*) "Top 10 Starting Values After Sorting by Length"

! output top 10 collatz start after sorting by length
top = 1
do i=size(allseq), 1, -1
        if( allseq(i)%length > allseq(i-1)%length ) then
                topTen(top) = allseq(i)
                print *, allseq(i)%start, allseq(i)%length
                top = top + 1
        end if
        if( top > 10 ) then
                EXIT
        end if

end do

! Sort top 10 collatz object by starting value
do i=2, 10
        j = i - 1
        temp = topTen(i)
        do while (j >= 1 .and. topTen(j)%start > temp%start)
                topTen(j+1) = topTen(j)
                j = j - 1
        end do
        topTen(j+1) = temp
end do

write(*,*) "Top 10 Starting Values After Sorting by Start"
! output top 10 collatz start after sorting by start
do i=10, 1, -1
        print *, topTen(i)%start, topTen(i)%length
end do

end program runCollatz

! Calculates recursively the collatz sequence for a given
! starting value
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
