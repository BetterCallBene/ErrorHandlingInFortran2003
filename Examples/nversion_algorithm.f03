! NVERSION_ALGORITHM
! 
!   Algorithm with several versions, each of them slower but less demanding in 
!   memory usage. Depending on the available amount of memory, which is not
!   determinable in advance, the best algorithm is chosen.
!   
!   This illustrates the use of the <exception_handling> module.
! 
! HISTORY
! 
!   20101021 KP - Initial version
!   20110104 KP - Preprocessable error code version added
! 
! AUTHOR
! 
!   Koen Poppe, Department of Computer Science,
!   Katholieke Universiteit Leuven, Celestijnenlaan 200A,
!   B-3001 Heverlee, Belgium
!   Email:  Koen.Poppe@cs.kuleuven.be
!
#include "exception_handling.h"

module nversion_algorithm

#ifdef EXCEPTION_HANDLING
    use exception_handling
#endif
    
    implicit none
    private
    save
    
    public :: my_nversion_algorithm
    
#ifndef EXCEPTION_HANDLING
    public :: print_error
#endif
    
    integer, dimension(:), allocatable :: workspace
    
contains

    ! Algorithm with 3 versions
    subroutine my_nversion_algorithm( N, ifail )
        
        ! Arguments
        integer, intent(in) :: N
        TYPE_EXCEPTION_ARGUMENT, optional :: ifail
        
        ! Local variables
        TYPE_EXCEPTION :: inform

        ! Try version 1
#ifndef EXCEPTION_HANDLING
        inform = -1 ! soft noisy
#endif
        call allocate_workspace( N*N*N, inform )
        if( inform == 0 ) then
            write(unit=*,fmt="(A)") "Performing my_nversion_algorithm version 1."
            deallocate(workspace)
#ifndef EXCEPTION_HANDLING
            if( present(ifail) ) then
                ifail = 0 ! success
            end if
#endif            
            return
        end if
#ifdef EXCEPTION_HANDLING
        call soft_silent_error( inform ) ! Discard, we'll try something else
#endif
        
        ! Try version 2
#ifndef EXCEPTION_HANDLING
        inform = -1 ! soft noisy
#endif
        call allocate_workspace( N*N, inform )
        if( inform == 0 ) then
            write(unit=*,fmt="(A)") "Performing my_nversion_algorithm version 2."
            deallocate(workspace)
#ifndef EXCEPTION_HANDLING
            if( present(ifail) ) then
                ifail = 0 ! success
            end if
#endif            
            return
        end if
#ifdef EXCEPTION_HANDLING
        call soft_silent_error( inform ) ! Discard, we'll try something else
#endif

        ! Try version 3, which is only valid for N even
        if( mod(N,2) == 1 ) then
#ifdef EXCEPTION_HANDLING
            call create_exception(inform, message_exception( & 
                "Version 3 is only valid for even values of N"), &
                "nversion_algorithm:my_nversion_algorithm" )
#else
            inform = -1 ! soft noisy error
            call handle_error( 3001, inform )
#endif
        else
#ifndef EXCEPTION_HANDLING
            inform = -1 ! soft noisy
#endif
            call allocate_workspace( N, inform )
            if( inform == 0 ) then
                write(unit=*,fmt="(A)") "Performing my_nversion_algorithm version 3."
                deallocate(workspace)
#ifndef EXCEPTION_HANDLING
                if( present(ifail) ) then
                    ifail = 0 ! success
                end if
#endif
                return
            end if
        end if
        
        ! Bailing out, no versions left
#ifdef EXCEPTION_HANDLING
        call create_exception(ifail, message_exception( &
            "Failed to perform any of the versions of the algorithm"), &
            inform,"nversion_algorithm:my_nversion_algorithm" )
#else
        call handle_error( 3002, ifail )
#endif
        
    end subroutine my_nversion_algorithm


    ! Exception enhanced workspace allocation
    subroutine allocate_workspace( workspace_size, ifail )
        
        ! Arguments
        integer, intent(in) :: workspace_size
        TYPE_EXCEPTION_ARGUMENT, optional :: ifail 
        
        ! Local arguments
        integer :: stat
        integer, parameter :: workspace_bound = 1000000
                
        ! Enforce a fixed memory bound
        if( workspace_size > workspace_bound ) then
#ifdef EXCEPTION_HANDLING
            call create_exception(ifail, memory_exception( workspace_bound, (/ workspace_size /) ), &
                "nversion_algorithm:allocate_workspace:enforced" )
#else
            call handle_error( 81001, ifail )
#endif
            return
        end if
        
        ! Verify unreasonable sizes
        if( workspace_size < 0) then
#ifdef EXCEPTION_HANDLING
            call create_exception(ifail, memory_exception( -1, (/ workspace_size /) ), &
                "nversion_algorithm:allocate_workspace:negative" )
#else
            call handle_error( 81002, ifail )
#endif
            return
        end if
        
        ! Allocate the array
        allocate( workspace(workspace_size), stat=stat )
        if( stat /= 0 ) then
#ifdef EXCEPTION_HANDLING
            call create_exception(ifail, memory_exception( stat, (/ workspace_size /) ), &
                "nversion_algorithm:allocate_workspace" )
#else
            call handle_error( 81000 + stat, ifail )
#endif
            return
        end if
        
#ifndef EXCEPTION_HANDLING
        if( present(ifail) ) then
            ifail = 0 ! success
        end if
#endif
        
    end subroutine allocate_workspace
    
#ifndef EXCEPTION_HANDLING
    subroutine print_error( inform )
        integer, intent(in) :: inform
        select case( inform )
            case( 0 )
                print *, "*** Internal error: Not an error, should never be reported..."
                
            ! nversion_algorithm error codes
            case( 3001 ) 
                print *, "Version 3 is only valid for even values of N"
            case( 3002 )
                print *, "Failed to perform any of the versions of the algorithm"
                
            ! allocation error codes
            case( 81001 )
                print *, "Allocation over 1000000 not allowed due to fixed memory bound"
            case( 81002 )
                print *, "Allocation of negative number of elements is not valid"
                
            ! collective error codes ...
            case default
                print *, "Allocation failed with stat=", (inform - 81000)
        end select
    end subroutine print_error
    subroutine handle_error( inform, ifail )
        integer, intent(in) :: inform
        integer, intent(in out), optional :: ifail
        
        if( inform /= 0 ) then
            if( present(ifail) ) then
                if( ifail <= 0 ) then ! soft noisy or hard
                    call print_error( inform )
                end if
                if( ifail == 0 ) then
                    write(unit=*,fmt=*) "Hard error: program terminated"
                    stop
                else ! soft silent or soft noisy
                    ifail = inform
                    return
                end if
            else ! soft noisy
                call print_error( inform )
                return
            end if
        else
            if( present(ifail) ) then
                ifail = 0
            end if
        end if
    end subroutine handle_error
#endif
    
end module nversion_algorithm
