// ignore_for_file: camel_case_types


abstract class shopStates{}
 class shopIntialState extends shopStates{}

   class shopBottomNavState extends shopStates{}

  class shopLoadingHomeState extends shopStates{}

   class shopSuccessHomeState extends shopStates{}
  
    class shopErrorHomeState extends shopStates{

      final String error;

       shopErrorHomeState(this.error);
    }
    // state GetCategory
     class shopSuccessCategoryState extends shopStates{}

   class shopErrorCategoryState extends shopStates{
   
   }