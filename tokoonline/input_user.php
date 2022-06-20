<?php
// nama file input_user.php
?>
<h3> Tambah Data User</h3>
<form action="proses.php?aksi=tambah" method="post">
<table width="400" border="0">
<tr>
	<td>Nama </td>
	<td>: </td>
	<td><input type="text" name="nama" size="35"> </td>
</tr>
<tr>
	<td>Alamat </td>
	<td>: </td>
	<td><input type="text" name="alamat" size="75"> </td>
</tr>
<tr>
	<td>Usia </td>
	<td>: </td>
	<td><input type="text" name="usia" size="25"> </td>
</tr>
<tr>
	<td>&nbsp; </td>
	<td>&nbsp;</td>
	<td><input type="submit" name="simpan" value="simpan"> </td>
</tr>
</table>
</form>
