class ValidationMixin {


  String validateEmail(String value) {
    //null if valid
    //String if invalid containing error message
    if(!value.contains('@')){
      return 'Please enter a valid email address';
    }

    return null;
  }

  String validatePassword(String value) {
    //null if valid
    //String if invalid containing error message
    if(value.length < 4){
      return 'password must be atleast 4 characters';
    }
    return null;
  }


}