({
  doInit : function(component, event, helper) {
  //onPageReferenceChange(component, event, helper);
      helper.findRecordValuesHelper(component);
      
  },
  
  onPageReferenceChange : function (component, event, helper){
      var myPageRef = comp.get("v.pageReference");
      var id = myPageRef.state.c__id;
      component.set("v.recordId",id);
  }
})