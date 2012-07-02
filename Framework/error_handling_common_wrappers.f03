! ERROR_HANDLING_COMMON_WRAPPERS
! 
!   Collection of wrapper arround commonly used intrinsic routines that need
!   to check some condition.
! 
! HISTORY
! 
!   20110411 KP - Initial version
!   20120702 (KP) - Re-generated (make autogenerated)
! 
! AUTHOR
! 
!   Koen Poppe, Department of Computer Science,
!   Katholieke Universiteit Leuven, Celestijnenlaan 200A,
!   B-3001 Heverlee, Belgium
!   Email:  Koen.Poppe@cs.kuleuven.be
!
! 2012-06-26 TODO: KP - What about different array bounds (i.e, allocate(a(0:4)) )
!                     - Lazy allocation?
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
        module procedure allocate_integer_rank1
        module procedure allocate_integer_rank2
        module procedure allocate_real_6_37_rank1
        module procedure allocate_real_6_37_rank2
        module procedure allocate_real_15_307_rank1
        module procedure allocate_real_15_307_rank2
    end interface
        public :: lazy_allocate
    interface lazy_allocate
        module procedure lazy_allocate_logical_rank1
        module procedure lazy_allocate_logical_rank2
        module procedure lazy_allocate_integer_rank1
        module procedure lazy_allocate_integer_rank2
        module procedure lazy_allocate_real_6_37_rank1
        module procedure lazy_allocate_real_6_37_rank2
        module procedure lazy_allocate_real_15_307_rank1
        module procedure lazy_allocate_real_15_307_rank2
    end interface
    

contains


    !--------------------------------------------------------------------------
    ! Procedure allocate
    !--------------------------------------------------------------------------
    
    subroutine allocate_logical_rank1( array, sizes, ifail )
        logical, dimension(:), allocatable, intent(out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out), optional :: ifail
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
        type(error), intent(out), optional :: ifail
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
    subroutine allocate_integer_rank1( array, sizes, ifail )
        integer, dimension(:), allocatable, intent(out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out), optional :: ifail
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
    end subroutine allocate_integer_rank1
    subroutine allocate_integer_rank2( array, sizes, ifail )
        integer, dimension(:,:), allocatable, intent(out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out), optional :: ifail
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
    end subroutine allocate_integer_rank2
    subroutine allocate_real_6_37_rank1( array, sizes, ifail )
        real(kind=selected_real_kind(6,37)), dimension(:), allocatable, intent(out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out), optional :: ifail
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
        type(error), intent(out), optional :: ifail
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
        type(error), intent(out), optional :: ifail
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
        type(error), intent(out), optional :: ifail
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

    !--------------------------------------------------------------------------
    ! Procedure lazy_allocate
    !--------------------------------------------------------------------------
    
    subroutine lazy_allocate_logical_rank1( array, sizes, ifail )
        logical, dimension(:), allocatable, intent(in out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out), optional :: ifail
        
        if( allocated(array) ) then
            if( size(array) == sizes ) then
                return ! OK, no need to re-allocate
            end if
            ! Wrong shape -> re-allocate
            deallocate( array )
        end if
        call allocate( array, sizes, ifail )
    end subroutine lazy_allocate_logical_rank1
    subroutine lazy_allocate_logical_rank2( array, sizes, ifail )
        logical, dimension(:,:), allocatable, intent(in out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out), optional :: ifail
        
        if( allocated(array) ) then
            if( all( shape(array) == sizes ) ) then
                return ! OK, no need to re-allocate
            end if
            ! Wrong shape -> re-allocate
            deallocate( array )
        end if
        call allocate( array, sizes, ifail )
    end subroutine lazy_allocate_logical_rank2
    subroutine lazy_allocate_integer_rank1( array, sizes, ifail )
        integer, dimension(:), allocatable, intent(in out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out), optional :: ifail
        
        if( allocated(array) ) then
            if( size(array) == sizes ) then
                return ! OK, no need to re-allocate
            end if
            ! Wrong shape -> re-allocate
            deallocate( array )
        end if
        call allocate( array, sizes, ifail )
    end subroutine lazy_allocate_integer_rank1
    subroutine lazy_allocate_integer_rank2( array, sizes, ifail )
        integer, dimension(:,:), allocatable, intent(in out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out), optional :: ifail
        
        if( allocated(array) ) then
            if( all( shape(array) == sizes ) ) then
                return ! OK, no need to re-allocate
            end if
            ! Wrong shape -> re-allocate
            deallocate( array )
        end if
        call allocate( array, sizes, ifail )
    end subroutine lazy_allocate_integer_rank2
    subroutine lazy_allocate_real_6_37_rank1( array, sizes, ifail )
        real(kind=selected_real_kind(6,37)), dimension(:), allocatable, intent(in out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out), optional :: ifail
        
        if( allocated(array) ) then
            if( size(array) == sizes ) then
                return ! OK, no need to re-allocate
            end if
            ! Wrong shape -> re-allocate
            deallocate( array )
        end if
        call allocate( array, sizes, ifail )
    end subroutine lazy_allocate_real_6_37_rank1
    subroutine lazy_allocate_real_6_37_rank2( array, sizes, ifail )
        real(kind=selected_real_kind(6,37)), dimension(:,:), allocatable, intent(in out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out), optional :: ifail
        
        if( allocated(array) ) then
            if( all( shape(array) == sizes ) ) then
                return ! OK, no need to re-allocate
            end if
            ! Wrong shape -> re-allocate
            deallocate( array )
        end if
        call allocate( array, sizes, ifail )
    end subroutine lazy_allocate_real_6_37_rank2
    subroutine lazy_allocate_real_15_307_rank1( array, sizes, ifail )
        real(kind=selected_real_kind(15,307)), dimension(:), allocatable, intent(in out) :: array
        integer, intent(in) :: sizes
        type(error), intent(out), optional :: ifail
        
        if( allocated(array) ) then
            if( size(array) == sizes ) then
                return ! OK, no need to re-allocate
            end if
            ! Wrong shape -> re-allocate
            deallocate( array )
        end if
        call allocate( array, sizes, ifail )
    end subroutine lazy_allocate_real_15_307_rank1
    subroutine lazy_allocate_real_15_307_rank2( array, sizes, ifail )
        real(kind=selected_real_kind(15,307)), dimension(:,:), allocatable, intent(in out) :: array
        integer, dimension(2), intent(in) :: sizes
        type(error), intent(out), optional :: ifail
        
        if( allocated(array) ) then
            if( all( shape(array) == sizes ) ) then
                return ! OK, no need to re-allocate
            end if
            ! Wrong shape -> re-allocate
            deallocate( array )
        end if
        call allocate( array, sizes, ifail )
    end subroutine lazy_allocate_real_15_307_rank2


end module error_handling_common_wrappers
    