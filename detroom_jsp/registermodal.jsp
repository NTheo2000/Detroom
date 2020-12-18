<div id="signUp" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content" id="modal1">
          <div class="signup-form">
            <form method="POST" action="registerController.jsp">
              <% if(request.getAttribute("message2") != null) { %>		
                <div class="alert alert-Success" role="alert"><%=(String)request.getAttribute("message") %></div>
              <% } %>
                <h2>Sign up</h2>
                <p class="hint-text">Create your account. It's quick and will make us happy.</p>
                <div class="form-group">
                  <input type="text" class="form-control" name="name" placeholder="Name" required="required">        	
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="surname" placeholder="Surname" required="required">        	
                </div>
                <div class="form-group">
                  <input type="email" class="form-control" name="auebmail" placeholder="AUEB Email" required="required">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" name="confirm_password" placeholder="Confirm password" required="required">
              </div>
               <div class="form-group" style="text-align: center;">
                <div class="form-check form-check-inline" style="text-align: center;">
                  <input class="form-check-input" type="radio" name="usertype" id="inlineRadio1" value="Student" required>
                  <label class="form-check-label" for="inlineRadio1" style="font-weight: 600;color:rgb(105, 104, 104);">Student</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="usertype" id="inlineRadio2" value="Professor" required>
                  <label class="form-check-label" for="inlineRadio2" style="font-weight: 600;color:rgb(105, 104, 104);">Professor</label>
                </div>
               </div>
              <div class="form-group">
                    <button type="submit" id="btn1"class="btn btn-primary btn-lg btn-block"data-toggle="modal" data-target="#registerModal">Sign up for Detroom</button>
                </div>
                <div class="form-group">
                    <p class="hint-text">By clicking “Sign up for Detroom”, you will be a part of us. We’ll occasionally send you account related email.</p>
                </div>
            </form>
          <div class="text-center" id="div1">Already to Detroom? <a href="login.html" id="a1">Sign in</a></div>
        </div>
        </div>
    </div>
</div>   