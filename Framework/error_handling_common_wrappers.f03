! ERROR_HANDLING_COMMON_WRAPPERS
! 
!   Collection of wrapper arround commonly used intrinsic routines that need
!   to check some condition.
! 
! HISTORY
! 
!   20110411 KP - Initial version
!   20120123 (KP) - Re-generated (make autogenerated)
! 
! AUTHOR
! 
!   Koen Poppe, Department of Computer Science,
!   Katholieke Universiteit Leuven, Celestijnenlaan 200A,
!   B-3001 Heverlee, Belgium
!   Email:  Koen.Poppe@cs.kuleuven.be
!
module error_handling_common_wrappers
    use error_handling_error
    use error_handling_common_errors
    implicit none
    private
    save
    public :: allocate
    interface allocate
        module procedure allocate_logical_rank1
        module procedure allocate_logical_rank2
        module procedure allocate_integer_2_rank1
        module procedure allocate_integer_2_rank2
        module procedure allocate_integer_4_rank1
        module procedure allocate_integer_4_rank2
        module procedure allocate_integer_9_rank1
        module procedure allocate_integer_9_rank2
        module procedure allocate_integer_18_rank1
        module procedure allocate_integer_18_rank2
        module procedure allocate_real_6_37_rank1
        module procedure allocate_real_6_37_rank2
        module procedure allocate_real_15_307_rank1
        module procedure allocate_real_15_307_rank2
        module procedure allocate_real_18_4931_rank1
        module procedure allocate_real_18_4931_rank2
        module procedure allocate_real_33_4931_rank1
        module procedure allocate_real_33_4931_rank2
    end interface
    

contains

    !--------------------------------------------------------------------------
    ! Procedure allocate
    !--------------------------------------------------------------------------
    
    subroutine allocate_logical_rank1( array, sizes, ifail )
        logical, dimension(:), allocatable, intent(out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, (/ sizes /) ) )
        end if
    end subroutine allocate_logical_rank1
    subroutine allocate_logical_rank2( array, sizes, ifail )
        logical, dimension(:,:), allocatable, intent(out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes(1),sizes(2) ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, sizes ) )
        end if
    end subroutine allocate_logical_rank2
    subroutine allocate_integer_2_rank1( array, sizes, ifail )
        integer(kind=selected_int_kind(2)), dimension(:), allocatable, intent(out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, (/ sizes /) ) )
        end if
    end subroutine allocate_integer_2_rank1
    subroutine allocate_integer_2_rank2( array, sizes, ifail )
        integer(kind=selected_int_kind(2)), dimension(:,:), allocatable, intent(out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes(1),sizes(2) ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, sizes ) )
        end if
    end subroutine allocate_integer_2_rank2
    subroutine allocate_integer_4_rank1( array, sizes, ifail )
        integer(kind=selected_int_kind(4)), dimension(:), allocatable, intent(out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, (/ sizes /) ) )
        end if
    end subroutine allocate_integer_4_rank1
    subroutine allocate_integer_4_rank2( array, sizes, ifail )
        integer(kind=selected_int_kind(4)), dimension(:,:), allocatable, intent(out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes(1),sizes(2) ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, sizes ) )
        end if
    end subroutine allocate_integer_4_rank2
    subroutine allocate_integer_9_rank1( array, sizes, ifail )
        integer(kind=selected_int_kind(9)), dimension(:), allocatable, intent(out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, (/ sizes /) ) )
        end if
    end subroutine allocate_integer_9_rank1
    subroutine allocate_integer_9_rank2( array, sizes, ifail )
        integer(kind=selected_int_kind(9)), dimension(:,:), allocatable, intent(out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes(1),sizes(2) ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, sizes ) )
        end if
    end subroutine allocate_integer_9_rank2
    subroutine allocate_integer_18_rank1( array, sizes, ifail )
        integer(kind=selected_int_kind(18)), dimension(:), allocatable, intent(out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, (/ sizes /) ) )
        end if
    end subroutine allocate_integer_18_rank1
    subroutine allocate_integer_18_rank2( array, sizes, ifail )
        integer(kind=selected_int_kind(18)), dimension(:,:), allocatable, intent(out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes(1),sizes(2) ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, sizes ) )
        end if
    end subroutine allocate_integer_18_rank2
    subroutine allocate_real_6_37_rank1( array, sizes, ifail )
        real(kind=selected_real_kind(6,37)), dimension(:), allocatable, intent(out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, (/ sizes /) ) )
        end if
    end subroutine allocate_real_6_37_rank1
    subroutine allocate_real_6_37_rank2( array, sizes, ifail )
        real(kind=selected_real_kind(6,37)), dimension(:,:), allocatable, intent(out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes(1),sizes(2) ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, sizes ) )
        end if
    end subroutine allocate_real_6_37_rank2
    subroutine allocate_real_15_307_rank1( array, sizes, ifail )
        real(kind=selected_real_kind(15,307)), dimension(:), allocatable, intent(out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, (/ sizes /) ) )
        end if
    end subroutine allocate_real_15_307_rank1
    subroutine allocate_real_15_307_rank2( array, sizes, ifail )
        real(kind=selected_real_kind(15,307)), dimension(:,:), allocatable, intent(out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes(1),sizes(2) ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, sizes ) )
        end if
    end subroutine allocate_real_15_307_rank2
    subroutine allocate_real_18_4931_rank1( array, sizes, ifail )
        real(kind=selected_real_kind(18,4931)), dimension(:), allocatable, intent(out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, (/ sizes /) ) )
        end if
    end subroutine allocate_real_18_4931_rank1
    subroutine allocate_real_18_4931_rank2( array, sizes, ifail )
        real(kind=selected_real_kind(18,4931)), dimension(:,:), allocatable, intent(out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes(1),sizes(2) ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, sizes ) )
        end if
    end subroutine allocate_real_18_4931_rank2
    subroutine allocate_real_33_4931_rank1( array, sizes, ifail )
        real(kind=selected_real_kind(33,4931)), dimension(:), allocatable, intent(out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, (/ sizes /) ) )
        end if
    end subroutine allocate_real_33_4931_rank1
    subroutine allocate_real_33_4931_rank2( array, sizes, ifail )
        real(kind=selected_real_kind(33,4931)), dimension(:,:), allocatable, intent(out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out) :: ifail
        integer :: stat
        allocate( array( sizes(1),sizes(2) ), stat=stat )
        if( stat /= 0 ) then
            call create_error( ifail, &
#ifdef FC_NO_DT_CONSTRUCTOR
                allocation_error_constructor( &
#else
                allocation_error( &
#endif
                 stat, sizes ) )
        end if
    end subroutine allocate_real_33_4931_rank2


end module error_handling_common_wrappers
    