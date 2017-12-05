! Hannah Gulle
! Computes the top 10 collatz starting integers within the given user range

program runCollatz

! c like struct holds the sequence start and sequence length
type collatz
        integer::start
        integer::length
end type

! collatz types for adding objects to the array of all collatz
! struct like objects
type(collatz) :: c, temp

! Dynamically allocated array that holds all collatz type structs
type(collatz), dimension(:), allocatable :: allseq

! Collatz Sequence Finding Variables
integer :: endval       ! Highest Starting Value
integer :: seqSize      ! Length of Sequence
integer :: start, top   ! Starting Value
integer :: i,j          ! Iterative Values

integer :: mem_stat     ! Allocation Error Code

! Holds the top ten collatz struct types
type(collatz), dimension(10) :: topTen 

! Retrieves the highest starting integer from the user
write(*,*) "Please Enter the Highest Starting Integer "
read(*,*) endval

! Dynamically allocates the collatz type array for the 
! given range of values
allocate( allseq( endval ), stat=mem_stat)
if(mem_stat /= 0) STOP "Memory Allocation Error"

! Determines and Constructs the array of collatz type structs
! for the user given range
do 10 i=2, endval, 1

        start = i
        seqSize = 0
        
        do while (start /= 1 )
                if( mod(start,2) == 0 ) then
                        start = start / 2
                else
                        start = (3*start)+1
                endif
                seqSize = seqSize + 1
        enddo

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

print *, "Top 10 Starting Values After Sorting by Length"
! Output top 10 collatz start values after sorting by length
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

! Sort top 10 collatz objects by starting value
do i=2, 10
        j = i - 1
        temp = topTen(i)
        do while (j >= 1 .and. topTen(j)%start > temp%start)
                topTen(j+1) = topTen(j)
                j = j - 1
        end do
        topTen(j+1) = temp
end do

print *, "Top 10 Starting Values After Sorting by Start"
! Output top 10 after sorting by start
do i=10, 1, -1
        print *, topTen(i)%start, topTen(i)%length
end do
end program runCollatz
