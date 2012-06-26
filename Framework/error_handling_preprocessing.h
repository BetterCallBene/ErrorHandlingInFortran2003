
// ERROR_HANDLING_PREPROCESSING
// 
//   Collection of macros that simplify the use of the error_handling module.
// 
// HISTORY
// 
//   20111109 KP - Initial version
//   20111110 KP - Ported to auto-generated system
//   20120626 (KP) - Re-generated (make autogenerated)
// 
// AUTHOR
// 
//   Koen Poppe, Department of Computer Science,
//   Katholieke Universiteit Leuven, Celestijnenlaan 200A,
//   B-3001 Heverlee, Belgium
//   Email: Koen.Poppe@cs.kuleuven.be
//

// Stringification
#define strstr(x) "x"
#define str(x) strstr(x)

#define CONTINUATION & NEWLINE


// assert_eq
#define __precondition(a) \
	call assert_eq( a,.true.,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
			
#define __precondition_eq(a,b) \
    call precondition_eq( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __precondition_eq_ifail(a,b) \
    call precondition_eq( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __postcondition(a) \
	call assert_eq( a,.true.,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
			
#define __postcondition_eq(a,b) \
    call postcondition_eq( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __postcondition_eq_ifail(a,b) \
    call postcondition_eq( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __check(a) \
	call assert_eq( a,.true.,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
			
#define __check_eq(a,b) \
    call check_eq( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __check_eq_ifail(a,b) \
    call check_eq( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __unittest(a) \
	call assert_eq( a,.true.,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
			
#define __unittest_eq(a,b) \
    call unittest_eq( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __unittest_eq_ifail(a,b) \
    call unittest_eq( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return

// assert_ne
#define __precondition_ne(a,b) \
    call precondition_ne( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __precondition_ne_ifail(a,b) \
    call precondition_ne( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __postcondition_ne(a,b) \
    call postcondition_ne( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __postcondition_ne_ifail(a,b) \
    call postcondition_ne( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __check_ne(a,b) \
    call check_ne( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __check_ne_ifail(a,b) \
    call check_ne( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __unittest_ne(a,b) \
    call unittest_ne( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __unittest_ne_ifail(a,b) \
    call unittest_ne( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return

// assert_lt
#define __precondition_lt(a,b) \
    call precondition_lt( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __precondition_lt_ifail(a,b) \
    call precondition_lt( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __postcondition_lt(a,b) \
    call postcondition_lt( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __postcondition_lt_ifail(a,b) \
    call postcondition_lt( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __check_lt(a,b) \
    call check_lt( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __check_lt_ifail(a,b) \
    call check_lt( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __unittest_lt(a,b) \
    call unittest_lt( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __unittest_lt_ifail(a,b) \
    call unittest_lt( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return

// assert_le
#define __precondition_le(a,b) \
    call precondition_le( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __precondition_le_ifail(a,b) \
    call precondition_le( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __postcondition_le(a,b) \
    call postcondition_le( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __postcondition_le_ifail(a,b) \
    call postcondition_le( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __check_le(a,b) \
    call check_le( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __check_le_ifail(a,b) \
    call check_le( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __unittest_le(a,b) \
    call unittest_le( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __unittest_le_ifail(a,b) \
    call unittest_le( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return

// assert_gt
#define __precondition_gt(a,b) \
    call precondition_gt( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __precondition_gt_ifail(a,b) \
    call precondition_gt( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __postcondition_gt(a,b) \
    call postcondition_gt( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __postcondition_gt_ifail(a,b) \
    call postcondition_gt( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __check_gt(a,b) \
    call check_gt( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __check_gt_ifail(a,b) \
    call check_gt( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __unittest_gt(a,b) \
    call unittest_gt( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __unittest_gt_ifail(a,b) \
    call unittest_gt( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return

// assert_ge
#define __precondition_ge(a,b) \
    call precondition_ge( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __precondition_ge_ifail(a,b) \
    call precondition_ge( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __postcondition_ge(a,b) \
    call postcondition_ge( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __postcondition_ge_ifail(a,b) \
    call postcondition_ge( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __check_ge(a,b) \
    call check_ge( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __check_ge_ifail(a,b) \
    call check_ge( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __unittest_ge(a,b) \
    call unittest_ge( a,b,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __unittest_ge_ifail(a,b) \
    call unittest_ge( a,b,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return

// assert_abserr
#define __precondition_abserr(a,b,epsabs) \
    call precondition_abserr( a,b,epsabs,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __precondition_abserr_ifail(a,b,epsabs) \
    call precondition_abserr( a,b,epsabs,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __postcondition_abserr(a,b,epsabs) \
    call postcondition_abserr( a,b,epsabs,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __postcondition_abserr_ifail(a,b,epsabs) \
    call postcondition_abserr( a,b,epsabs,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __check_abserr(a,b,epsabs) \
    call check_abserr( a,b,epsabs,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __check_abserr_ifail(a,b,epsabs) \
    call check_abserr( a,b,epsabs,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __unittest_abserr(a,b,epsabs) \
    call unittest_abserr( a,b,epsabs,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __unittest_abserr_ifail(a,b,epsabs) \
    call unittest_abserr( a,b,epsabs,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return

// assert_relerr
#define __precondition_relerr(a,b,epsrel) \
    call precondition_relerr( a,b,epsrel,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __precondition_relerr_ifail(a,b,epsrel) \
    call precondition_relerr( a,b,epsrel,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __postcondition_relerr(a,b,epsrel) \
    call postcondition_relerr( a,b,epsrel,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __postcondition_relerr_ifail(a,b,epsrel) \
    call postcondition_relerr( a,b,epsrel,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __check_relerr(a,b,epsrel) \
    call check_relerr( a,b,epsrel,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __check_relerr_ifail(a,b,epsrel) \
    call check_relerr( a,b,epsrel,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return
#define __unittest_relerr(a,b,epsrel) \
    call unittest_relerr( a,b,epsrel,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ )
#define __unittest_relerr_ifail(a,b,epsrel) \
    call unittest_relerr( a,b,epsrel,ifail,CONTINUATION a_name=str(a),b_name=str(b),CONTINUATION filename=__FILE__,line=__LINE__ ); \
    if( is_error(ifail) ) return