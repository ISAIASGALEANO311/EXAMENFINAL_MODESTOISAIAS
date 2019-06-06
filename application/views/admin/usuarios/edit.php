
<!-- =============================================== -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
        Usuarios
        <small>Editar</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="box box-solid">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                    <?php if($this->session->flashdata("error")): ?>
                <div class="alert alert-danger alert-dismissible">
                <p><?php echo $this->session->flashdata("error");?></p>
                </div>
            <?php endif; ?>
                        <form action="<?php echo base_url(); ?>administrador/usuarios/update" method="post">
                        <input type="hidden" name="idusuario"value="<?php echo $usuario->id;?>">
                        <div class="form-group <?php echo!empty(form_error("nombre"))?'has-error':'';?>">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control"id="nombres" name="nombres" value="<?php echo $usuario->nombres;?>">                        </div>
                        <div class="form-group">
                        <label for="nombre">Apellido:</label>
                        <input type="text" class="form-control"id="apellidos" name="apellidos"value="<?php echo $usuario->apellidos;?>">
                        </div>
                        <div class="form-group">
                        <label for="nombre">Celular:</label>
                        <input type="text" class="form-control"id="celular" name="celular"value="<?php echo $usuario->celular;?>">
                        </div>
                        <div class="form-group">
                        <label for="nombre">Email:</label>
                        <input type="text" class="form-control"id="email" name="email"value="<?php echo $usuario->email;?>">
                        </div>
                        <div class="form-group">
                        <label for="nombre">Username:</label>
                        <input type="text" class="form-control"id="username" name="username"value="<?php echo $usuario->username;?>">
                        </div>
                        
                        <div class="form-group">
                        <label for="nombre">Rol:</label>
                        <select name="rol" id="rol" class="form-control">
                            <?php foreach($roles as $rol):?>
                            <option value="<?php echo $rol->id;?>"
                                <?php echo $rol->id == $usuario->rol_id ? "selected" :"";?>>
                                <?php echo $rol->nombre;?></option>
                            <?php endforeach;?>
                        </select>
                        </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-success btn-flat">
                                Guardar
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

