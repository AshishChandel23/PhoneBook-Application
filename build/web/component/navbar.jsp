
<%@ page import="com.entity.*"%>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:darkslategray;">
  <div class="container-fluid">
    <a class="navbar-brand text-info" href="index.jsp"> <i class="fa-solid fa-blender-phone"></i> PhoneBook-App</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 gap-3">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fa-solid fa-house-user"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="addcontact.jsp"><i class="fa-solid fa-user-plus"></i> Add contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="viewcontact.jsp"><i class="fa-solid fa-eye"></i> View contact</a>
        </li>
      </ul>
      <%
          User user = (User) session.getAttribute("user");
          if(user==null){
          %>
          <form class="d-flex gap-3" role="search">
          <a class="btn btn-outline-info" href="login.jsp"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
        
          <a class="btn btn-outline-warning" href="register.jsp"><i class="fa-solid fa-id-card"></i> Register</a>
          </form>
          <%
          }
          else{
          %>
          <form class="d-flex gap-3" role="search">
          <a class="btn btn-outline-info" href=""><i class="fa-solid fa-house-user"></i> <%= user.getName() %></a>
          <!-- Button trigger modal -->
          <a class="btn btn-outline-warning"data-bs-toggle="modal" data-bs-target="#exampleModalCenter" ><i class="fa-solid fa-arrow-right-to-bracket"></i> LogOut</a>
          </form>
          <%
          }
      %>
      
    </div>
  </div>
      <!<!-- Logout popup -->
        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Are you sure to Logout</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true"><i class="fa-solid fa-circle-xmark"></i></span>
                </button>
              </div>
              <div class="modal-body text-center">
                <button type="button" class="btn btn-outline-danger mx-3" data-bs-dismiss="modal"><i class="fa-solid fa-circle-xmark"></i> Close</button>
                <a class="btn btn-outline-primary mx-3" href="logout"><i class="fa-solid fa-arrow-right-to-bracket"></i> LogOut</a>
              
              </div>
              <div class="modal-footer">
              </div>
            </div>
          </div>
        </div>
      <!<!-- Logout popup -->
</nav>