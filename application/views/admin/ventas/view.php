
<div class="row">
	<div class="col-xs-12 text-center">
		<b>Empresa IMPORCART</b><br>
		AV. Antequera <br>
		Tel. 098******* <br>
		Email:solodeprueba@gmail.com
	</div>
</div> <br>
<div class="row">
	<div class="col-xs-6">	
		<b>CLIENTE</b><br>
		<b>Nombre:</b> <?php echo $ventas->nombre;?> <br>
		<b>Nro Documento:</b> <?php echo $ventas->documento;?><br>
		<b>Telefono:</b> <?php echo $ventas->telefono;?> <br>
		<b>Direccion</b> <?php echo $ventas->direccion;?><br>
	</div>	
	<div class="col-xs-6">	
		<b>COMPROBANTE</b> <br>
		<b>Tipo de Comprobante:</b> <?php echo $ventas->tipocomprobante;?><br>
		<b>Serie:</b> <?php echo $ventas->serie;?><br>
		<b>Fecha</b> <?php echo $ventas->fecha;?>
	</div>	
</div>
<br>
<div class="row">
	<div class="col-xs-12">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Codigo</th>
					<th>Nombre</th>
					<th>Precio</th>
					<th>Cantidad</th>
					<th>Importe</th>
				</tr>
			</thead>
			<tbody>
				<?php foreach($detalles as $detalle):?>
				<tr>
					<td><?php echo $detalle->codigo;?></td>
					<td><?php echo $detalle->nombre;?></td>
					<td><?php echo $detalle->precio;?></td>
					<td><?php echo $detalle->cantidad;?></td>
					<td><?php echo $detalle->importe;?></td>
				</tr>
				<tr>
                     <?php endforeach;?>
					<td><strong>Subtotal:</strong></td>
					<td><?php echo $ventas->subtotal;?></td>
					<td><strong>IGV:</strong></td>
					<th><?php echo $ventas->igv;?></th>
					<td><strong>Descuento:</strong></td>
					<td><?php echo $ventas->descuento;?></td>
				</tr>
				<!-- <tr>
					<th colspan="4" class="text-right"><strong>Subtotal:</strong></th>
					<th><?php echo $venta->subtotal;?></th>
					<th colspan="4" class="text-right"><strong>IGV:</strong></th>
					<th><?php echo $venta->igv;?></th>
					<th colspan="4" class="text-right"><strong>Descuento:</strong></th>
					<th><?php echo $venta->descuento;?></th>
				</tr> -->
				<!-- <tr>
					<td><?php echo $venta->subtotal;?></td>
					<td><?php echo $venta->igv;?></td>
					<td><?php echo $venta->descuento;?></td>
				</tr> -->
				</tbody>
				<tfoot>
				<tr>
					<td></td>
					<td colspan="4" class="text-right"><strong>Total:</strong></td>
					<td><?php echo $ventas->total;?></td>
			</tfoot>
		</table>
		
	</div>
</div>