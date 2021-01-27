<div id="editProfessor" class="modal fade">
  <div class="modal-dialog">
      <div class="modal-content" id="modal1">
        <div class="signup-form">
          <form method="POST" action="editControllerProfessor.jsp">
            <% if(request.getAttribute("message5") != null) { %>		
              <div class="alert alert-danger" role="alert"><%=(String)request.getAttribute("message5") %></div>
            <% } %>
              <h2>Edit your profile</h2>
              <div class="form-group">
                <input type="text" class="form-control" name="location" placeholder="Location">        	
              </div>
              <div class="form-group">
                <input type="date" class="form-control" name="birthday" placeholder="Birthday">        	
              </div>
              <div class="form-group">
                  <input type="password" class="form-control" name="password" placeholder="Current password">
              </div>
              <div class="form-group">
                <input type="password" class="form-control" name="new_password" placeholder="New password">
            </div>
            <div class="form-group">
              <input type="url" class="form-control" name="facebook" placeholder="Facebook url">
            </div>
            <div class="form-group">
              <input type="url" class="form-control" name="linkedin" placeholder="Linkedin url">
            </div>
            <div class="form-group">
              <input type="text" class="form-control" name="subject" placeholder="Subject url">
            </div>
            <div class="form-group">
              <input type="text" class="form-control" name="mobile" placeholder="Mobile number">
            </div>
            <div class="form-group">
              <input type="text" class="form-control" name="bio" placeholder="Bio">
            </div>
            <div class="form-group">
              <input type="email" class="form-control" name="email" placeholder="Email">
          </div>
          <div class="form-group">
            <button type="submit" id="btn1"class="btn btn-primary btn-lg btn-block"data-toggle="modal" >Submit changes</button>
          </div>
          </form>
      </div>
      </div>
  </div>
</div>