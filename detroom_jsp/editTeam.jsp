<div id="editTeam" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content" id="modal1">
          <div class="signup-form">
            <form method="POST" action="editTeamController.jsp?idteam=<%=idteam%>">
              <% if(request.getAttribute("message7") != null) { %>		
                <div class="alert alert-danger" role="alert"><%=(String)request.getAttribute("message7") %></div>
              <% } %>
                <h2>Edit your team</h2>
                <div class="form-group">
                  <input type="text" class="form-control" name="name" placeholder="Team name">        	
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="description" placeholder="Team description">
                </div>
                <div class="form-group">
                    <button type="submit" id="btn1"class="btn btn-primary btn-lg btn-block"data-toggle="modal" >Submit changes</button>
                </div>
            </form>
        </div>
        </div>
    </div>
  </div>