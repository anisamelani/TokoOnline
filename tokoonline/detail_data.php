<?php
include "database.php";
$db=new database();
// nama file detail_data.php
foreach($db->detail($_GET['id']) as $data){
?>
<h3> Profil Data <?php echo strtoupper( $data['nama']);?></h3>
<table width="400" border="0">
<tr>
	<td>Nama </td>
	<td>: </td>
	<td><?php echo $data['nama'];?> </td>
</tr>
<tr>
	<td>Alamat </td>
	<td>: </td>
	<td><?php echo $data['alamat'];?></td>
</tr>
<tr>
	<td>Usia </td>
	<td>: </td>
	<td><?php echo $data['usia'];?> </td>
</tr>
<tr>
	<td>&nbsp; </td>
	<td>&nbsp;</td>
	<td><a href="tampildata.php">Back to Data</a> </td>
</tr>
</table>

<?php }?>