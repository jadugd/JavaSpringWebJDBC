<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<br/><br/><br/>
 <!-- Content Header (Page header) -->
    <section class="content-header">
      <!-- box header -->
      <div class="box box-primary box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">List Souvenir Request</h3>
        </div>
        <!-- box header -->
        <!-- panel breadcrumb -->
        <div class="panel panel-default" style="border-color: white; margin-bottom: 0px;">
          <div class="panel-body" style="padding: 10px;">
            <ol class="breadcrumb" style="background-color: #f5f5f5;">
                  <li><a href="/marcom174/index.html"> Home</a></li>
                  <li><a href="#">Master</a></li>
                  <li class="active">List Souvenir Request</li>
                </ol>
          <!-- </div>
          <div class="panel-body" style="padding: 10px;"> -->
            <div class="col-md-11"></div>
            <div class="col-md-1">
              <span></span>
            </div>
          </div>
        </div>
        <div class="box-body">
        
          <!-- FORM SEARCH -->
          <table class="table" id="table-souvenir-search">
            <thead>
            	<tr>
					<th colspan="8"></th>
					<th>
						<button type="button" class="btn btn-primary btn-block" id="button-add">Add</button>
					</th>
				</tr>
            </thead>
              <tr>
                <th colspan="2">
                  <input class="form-control" type="text" id="data1" placeholder="Transaction Code"/>
                </th>
                <th>
                  <input class="form-control" type="text" id="data2" placeholder="Request By"/>
                </th>
                <th>
                  <div class="form-group has-feedback">
						<input type="text" name="data3" id="data3" class="form-control"
							placeholder="Request Date"> <span style="color: gray;"
							class="glyphicon glyphicon-calendar form-control-feedback"></span>
					</div>
                </th>
                <th>
                 	<div class="form-group has-feedback">
						<input type="text" name="data4" id="data4" class="form-control"
							placeholder="Due Date"> <span style="color: gray;"
							class="glyphicon glyphicon-calendar form-control-feedback"></span>
					</div>
                </th>
                <th>
                  <input type="text" class="form-control" id="data5" name="data5" placeholder="Status" />
                </th>
                <th>
                 	<div class="form-group has-feedback">
						<input type="text" name="data6" id="data6" class="form-control"
							placeholder="Created"> <span style="color: gray;"
							class="glyphicon glyphicon-calendar form-control-feedback"></span>
					</div>
                </th>
                <th>
                  <input type="text" class="form-control" id="data7" name="data7" placeholder="Created By" />
                </th>
                <th>
                  <button type="button" id="button-search" style="size: 5" class="btn btn-warning btn-block">Search</button>
                </th>
              </tr>
          </table>
          <!-- FORM SEARCH -->
          
          <table class="table table-hover" id="table-souvenir-request">
            <thead>
              <tr>
                <th>No</th>
                <th>Transaction Code</th>
                <th>Request By</th>
                <th>Request Date</th>
                <th>Due Date</th>
                <th>Status</th>
                <th>Created Date</th>
                <th>Create By</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody id="list-data-souvenir-request">
              <tr></tr>
            </tbody>
          </table>
          <div id="edit-alert" class="alert alert-warning collapse">
            <a href="#" class="close" data-dismiss="alert">&times;</a>
            <strong>Data Updated !</strong> New Product has been Updated
          </div>
        </div>
        <!-- box body -->
      </div>
      <!-- box -->

    <!-- Popup -->
    <div id="modal-input" class="modal fade">

      <div class="modal-dialog">
      
        
      </div>

    </div>
    <!-- Popup -->
    </section>

<script>

  listDataSouvenir();

  function listDataSouvenir() {
    $.ajax({
      url:"souvenirreq_request/list.html",
      type:"get",
      dataType:"html",
      success: function(result){
        $("#list-data-souvenir-request").html(result);
      }
    });
  }
  
  $(document).ready(function(){
	  
	//Date picker
      $('#data3,#data4,#data6').datepicker({
        autoclose: true,
        format: 'dd/mm/yyyy'
      });

      $('#data4').datepicker({
        autoclose: true,
        format: 'dd/mm/yyyy'
      });
    
    // DataTable
      var table = $('#table-souvenir-request').DataTable( {
        	'sDom':'tip',
          ordering:   false
      } );
   
      $("#table-souvenir-search").on("click", "#button-search", function() {
        for (var i = 1; i < 8; i++) {
          table.column(i).search($("#data"+ i).val()).draw();
      	}
      });
    
    $("#button-add").on("click", function(){
      $.ajax({
        url:"souvenirreq_request/add.html",
        type:"get",
        dataType:"html",
        success: function(result){
          $("#modal-input").find(".modal-dialog").html(result);
          $("#modal-input").modal("show");
        }
      });
      
    });    
    
    $("#modal-input").on("submit","#form-souvenir-request-add", function(){
    	$('.dynamic').each(function() {
            $(this).rules("add", 
                {
                    required: true,
                    messages: {
                        required: "Can't be null",
                    }
                });
        });
      
      if (!$("#form-souvenir-request-add").valid()) return false;
      
      
      $.ajax({
        url:"souvenirreq_request/add/save.json",
        type:"get",
        dataType:"json",
        data:$(this).serialize(),
        success: function(result){
          $("#modal-input").modal("hide");
          /* alert("<b>Data Saved!</b> New souvenir has been add with code "+result.souvenirRequestModel.code); */
          swal({
			  title: 'Data Saved!',
			  text: 'Transaction Souvenir Request has been add with code '+result.souvenirRequestModel.code,
			  type: 'success',
			  confirmButtonText: 'OK'
			})
          listDataSouvenir();
        },
        error: function(jqXHR, textStatus, errorThrown){
          nameMenu.style.borderColor="red";
          alertNameSame.style.display="block";
        }
      });
      return false;
    });
      
      
    $("#list-data-souvenir-request").on("click", "#button-detail", function(){
      var idDetail = $(this).val();
      $.ajax({
        url:"souvenirreq_request/detail.html",
        type:"get",
        dataType:"html",
        data: {id:idDetail},
        success: function(result){
          $("#modal-input").find(".modal-dialog").html(result);
          $("#modal-input").modal("show");
        }
      });
      
    });
      
  });
  

</script>