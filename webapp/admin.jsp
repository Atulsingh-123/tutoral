<%@page import="java.util.Map"%>
<%@page import="com.mycompany.e_commerse.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.e_commerse.entities.Category"%>
<%@page import="com.mycompany.e_commerse.dao.CategoryDao"%>
<%@page import="com.mycompany.e_commerse.helper.FactoryProvider"%>
<%@page import="com.mycompany.e_commerse.entities.User"%>
<%
       User user = (User) session.getAttribute("current-user");
       if(user == null)
       {
           session.setAttribute("message","You are not logged in !! Login First");
           response.sendRedirect("login.jsp");
           return;
       }
       else{
           if(user.getUserType().equals("normal")){
               session.setAttribute("message","You are not Admin !! ");
               response.sendRedirect("login.jsp");
               return;
           }
       }

%>

              <%  

                    CategoryDao cdao =  new CategoryDao(FactoryProvider.getFactory());
                    List<Category> list = cdao.getCategores();
                    

                Map<String,Long> m =    Helper.getCounts(FactoryProvider.getFactory());

              %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panal</title>
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container" class="admin">
            
            <div class="container-fluid mt-3">
                
                <%@include file="components/message.jsp" %>
            </div>
            
            
            
            <div class="row mt-3">
     <!--            //////////////////////////////////-->           
                <div class="col-md-4">
                    <div class="card">
                        <div class ="card-body text-center">
                            
                               <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/man.png" alt="user_icon">
                                
                            </div>
                            
                            <h1><%= m.get("userCount") %></h1>
                            <h1 class = "text-uppercase text-muted">Users</h1>
                        </div>
                        
                        
                    </div>

                </div>
     <!--            //////////////////////////////////-->
                 <div class="col-md-4">
                     <div class="card">
                        <div class ="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
                                
                            </div>
                            
                            <h1><%= list.size()%></h1>
                            <h1 class = "text-uppercase text-muted">Category</h1>
                        </div>
                        
                        
                    </div>
                     
                    
                </div>
  <!--            //////////////////////////////////-->
                 <div class="col-md-4">
                    <div class="card">
                        <div class ="card-body text-center">
                            
                               <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/delivery-box.png" alt="user_icon">
                                
                            </div>
                            
                            <h1><%= m.get("productCount") %></h1>
                            <h1 class = "text-uppercase text-muted">Products</h1>
                        </div>
                        
                        
                    </div>
                </div>
   
            </div>
<!--          /////////////////////////////////////////////////              -->

  <div class="row mt-3">
     <!--            //////////////////////////////////-->           
                <div class="col-md-6">
                    <div class="card" class="card" data-toggle = "modal" data-target = "#add-category-modle">
                        <div class ="card-body text-center">
                            
                               <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon">
                                
                            </div>
                            
                            <p class="mt-2">click here to add new category</p>
                            <h1 class = "text-uppercase text-muted">Add category</h1>
                        </div>
                        
                        
                    </div>

                </div>

  <!--            //////////////////////////////////-->
                 <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modle">
                        <div class ="card-body text-center">
                            
                               <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon">
                                
                            </div>
                            
                            <p class = "mt-2">click here to add new products</p>
                            <h1 class = "text-uppercase text-muted">Add Products</h1>
                        </div>
                        
                        
                    </div>
                </div>
   

            </div>



        </div>
        
<!--        /////////////////////////////////-->



<!-- Modal -->
<div class="modal fade" id="add-category-modle" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          <form action = "productOperationServlet" method="post">
              
              <input type="hidden" name="operation" value="addcategory">
              
              <div class="form-group">
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Tital" required/>
                  
              </div>
              
              <div>
                  <textarea style="height: 200px" class="form-control" placeholder="Enter category description " name="catDescription" required ></textarea>
                  
              </div>
              
              <div class="container text-center">
                  <button class="btn btn-outline-success">Add Category</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
          </form>
          
        
      </div>
      
    </div>
  </div>
</div>

<!--        /////////////////////////////////-->


<!-- Modal -->
<div class="modal fade" id="add-product-modle" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          <form action="productOperationServlet" method="post" enctype="multipart/form-data">
              
               <input type="hidden" name="operation" value="addproduct">
              
              <div class="form-group">
                  <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required/>
              </div>
              
              <div class="form-group">
                  <textarea style="height : 120px;"   class="form-control" placeholder="Enter product description" name="pDesc"></textarea>
              </div>
              
             <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required/>
              </div>
              
             <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required/>
              </div>
              
             <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter product Quantity" name="pQuantity" required/>
              </div>
              
              
               <div class="form-group">
                   <select name="catId" class="form-control" id="">
                       
                       <option value="Select Category">Select Category</option>
                      
                         <%
                               for(Category c : list) {
                           %>
                       
                           <option value="<%=   c.getCategoryId() %>"> <%= c.getCategoryTital() %></option>
                   
                           <%  } %>
                   </select>   
               </div>
            
              <div class="form-group">
                  <label  for="pPic">Select Picture of product</label> 
                  <br>
                  <input type="file" name="pPic" required>    
              </div>
              
              <div class="container text-center">
                  
                  <button class="btn btn-outline-success">Add product</button>
              </div>
              
              
              
              
          </form>
          
          
          
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



        <!--        /////////////////////////////////-->

        <%@include file="components/common_modals.jsp" %>

    </body>
</html>
