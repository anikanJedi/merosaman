function ManageInventory(){


}

function PurchaseOrder(){



}

function SalesOrder(){


}

function Accounts(){


}


function AddView(){
    var articleData1;
    (function() {
    var productAPI = "http://localhost/MA/php/api.php?module=event&task=list";
    $.getJSON( productAPI)
    .done(function( data ) {
    if(data.status==200){
        $("#addlist").empty();
        eventList = data.data;
        $.each( eventList, function( i, event ) {
        
            var eventName1 = $("<h2>").html(event.Product_ID);
            var eventName2 = $("<h2>").html(event.Product_Name);
           // var eventName3 = $("<h2>").html(event.Product_Quantity);
            var listitem = $("<li>");
            listitem.append("Product ID: ",eventName1);
            listitem.append("Product Name: ",eventName2);
            //listitem.append("Product Quantity: ",eventName3);
            $("#addlist").append(listitem);
                                
        });
        $("#addlist").listview("refresh");
    }
                                
});
})();
}

function PurchaseView(){
    var articleData1;
    (function() {
    var productAPI = "http://localhost/MA/php/api.php?module=event&task=list";
    $.getJSON( productAPI)
    .done(function( data ) {
    if(data.status==200){
        $("#purchaselist").empty();
        eventList = data.data;
        $.each( eventList, function( i, event ) {
        
            var eventName1 = $("<h2>").html(event.Product_ID);
            var eventName2 = $("<h2>").html(event.Product_Name);
        //    var eventName3 = $("<h2>").html(event.Purchase_Quantity);
            var listitem = $("<li>");
            listitem.append("Product ID: ",eventName1);
            listitem.append("Product Name: ",eventName2);
          //  listitem.append("Product Quantity: ",eventName3);
            $("#purchaselist").append(listitem);
                                
        });
        $("#purchaselist").listview("refresh");
    }
                                
});
})();
}

function SalesView(){
    var articleData1;
    (function() {
    var productAPI = "http://localhost/MA/php/api.php?module=event&task=list";
    $.getJSON( productAPI)
    .done(function( data ) {
    if(data.status==200){
        $("#saleslist").empty();
        eventList = data.data;
        $.each( eventList, function( i, event ) {
        
            var eventName1 = $("<h2>").html(event.Product_ID);
            var eventName2 = $("<h2>").html(event.Product_Name);
        //    var eventName3 = $("<h2>").html(event.Purchase_Quantity);
            var listitem = $("<li>");
            listitem.append("Product ID: ",eventName1);
            listitem.append("Product Name: ",eventName2);
          //  listitem.append("Product Quantity: ",eventName3);
            $("#saleslist").append(listitem);
                                
        });
        $("#saleslist").listview("refresh");
    }
                                
});
})();
}

function ReturnView(){
    var articleData1;
    (function() {
    var productAPI = "http://localhost/MA/php/api.php?module=event&task=list";
    $.getJSON( productAPI)
    .done(function( data ) {
    if(data.status==200){
        $("#returnlist").empty();
        eventList = data.data;
        $.each( eventList, function( i, event ) {
        
            var eventName1 = $("<h2>").html(event.Product_ID);
            var eventName2 = $("<h2>").html(event.Product_Name);
        //    var eventName3 = $("<h2>").html(event.Purchase_Quantity);
            var listitem = $("<li>");
            listitem.append("Product ID: ",eventName1);
            listitem.append("Product Name: ",eventName2);
          //  listitem.append("Product Quantity: ",eventName3);
            $("#returnlist").append(listitem);
                                
        });
        $("#returnlist").listview("refresh");
    }
                                
});
})();
}


function Display(){
   // var articleData;
    (function() {
    var productAPI = "http://localhost/MA/php/api.php?module=event&task=list";
    $.getJSON( productAPI)
    .done(function( data ) {
    if(data.status==200){
        $("#productlist").empty();
        eventList = data.data;
        $.each( eventList, function( i, event ) {
        
            var eventName1 = $("<h2>").html(event.Product_ID);
            var eventName2 = $("<h2>").html(event.Product_Name);
            var eventName3 = $("<h2>").html(event.Purchase_Quantity);
            var listitem = $("<li>");
            listitem.append("Product ID: ",eventName1);
            listitem.append("Product Name: ",eventName2);
            listitem.append("Product Quantity: ",eventName3);
            $("#productlist").append(listitem);
                                
        });
        $("#productlist").listview("refresh");
    }
                                
});
})();
}



function Addproduct(){
    var productname = $("#productname").val();
    var productID = $("#productID").val();
    var productquantity = $("#productquantity").val();
    // alert ("into Addproduct");
    if( productname =='' || productID =='' || productquantity==''){

        alert("Please fill all fields!!!");
    }else{
        
        userApi="http://localhost/MA/php/api.php?module=user&task=addproduct";
        $.post(userApi,{productname:productname, productID:productID, productquantity:productquantity})
            .done(function(response) {

                alert("Product added Successfully");
                    window.location="index.html#Inventory";
            });
    }
}



function Purchase(){
    var productname = $("#purchasename").val();
    var productID = $("#purchaseID").val();
    var purchasequantity = $("#purchasequantity").val();
    if( productname =='' || productID =='' || purchasequantity==''){

        alert("Please fill all fields!!!");
    }else{
        userApi="http://localhost/MA/php/api.php?module=user&task=purchase";
        $.post(userApi,{productname:productname, productID:productID, purchasequantity:purchasequantity})
            .done(function(response) {

                alert("Purchase Updated Successfully");
                    window.location="index.html#Inventory";
            });
    }
}

function Sales(){
    var productname = $("#salesname").val();
    var productID = $("#salesID").val();
    var salesquantity = $("#salesquantity").val();
    alert(productID);
    alert(productname);
    alert(salesquantity);
    if( productname =='' || productID =='' || salesquantity==''){

        alert("Please fill all fields!!!");
    }else{
        userApi="http://localhost/MA/php/api.php?module=user&task=sales";
        $.post(userApi,{ productname:productname, productID:productID, salesquantity:salesquantity})
        .done(function(response) {

            alert("Sales Updated Successfully")
                window.location="index.html#Inventory";
        });   
    }
}

function Returned(){
    var productname = $("#returnedname").val();
    var productID = $("#returnedID").val();
    var returnquantity = $("#returnedquantity").val();
    if( productname =='' || productID =='' || returnquantity==''){
        
        alert("Please fill all fields!!!");
    }else{
        userApi="http://localhost/MA/php/api.php?module=user&task=return";
        $.post(userApi,{ productname:productname, productID:productID, returnquantity:returnquantity})
        .done(function(response) {

            alert("Damaged/Return Items Updated Successfully")
                window.location="index.html#Inventory";
        });
    }
}
