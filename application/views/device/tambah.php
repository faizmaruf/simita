<section class="content-header">
    <h1>
        Tambah
        <small>Inventaris Device Suport</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-suitcase"></i>Inventaris</a></li>
        <li class="active">Device</li>
    </ol>
</section>


<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                <div class="col-md-5">
                <?php
                    echo form_open('device/add');
                ?>                   
                    <div class="box-body"> 
                        <div class="form-group">
                            <label for="example">No Inventaris</label>
                            <input type="text" autocomplete="off" id="no_inventaris" name="no_inventaris" class="form-control " readonly required oninvalid="setCustomValidity('NoInventaris Wajib Diisi !')"
                                   oninput="setCustomValidity('')" placeholder="<?php echo $no_inventaris ?>"  value="<?php echo $no_inventaris ?>"  >
                                   <?php echo form_error('no_inventaris', '<div class="text-red">', '</div>'); ?>
                        </div> 
                        <div class="form-group">
                            <label>Device Type</label>
                            <input name="jenis" onkeyup="this.value = this.value.toUpperCase()" class="form-control" rows="3" required oninvalid="setCustomValidity('Tipe Device Harus di Isi !')"
                                   oninput="setCustomValidity('')" placeholder="Switch, HUB, Router, CCTV, Dll">
                            <?php echo form_error('jenis', '<div class="text-red">', '</div>'); ?>                            
                        </div>                             
                        <div class="form-group">
                            <label for="">Spesifikasi</label>
                            <textarea name="spek" onkeyup="this.value = this.value.toUpperCase()" class="form-control" rows="3" required oninvalid="setCustomValidity('Spesifikasi Device Harus di Isi !')"
                                   oninput="setCustomValidity('')" placeholder="Spesifikasi"></textarea>
                            <?php echo form_error('spek', '<div class="text-red">', '</div>'); ?>
                        </div>
                        <div class="form-group">
                            <label for="example">Harga Beli</label>
                            <input type="number" name="harga" class="form-control" required oninvalid="setCustomValidity('Harga Beli Harus di Isi !')"
                                   oninput="setCustomValidity('')" placeholder="Harga Beli Laptop" >
                                   <?php echo form_error('harga', '<div class="text-red">', '</div>'); ?>
                        </div>
                        <div class="form-group">
                            <label>Lokasi Penggunaan</label>
                            <input name="lokasi" onkeyup="this.value = this.value.toUpperCase()" class="form-control" rows="3" required oninvalid="setCustomValidity('Lokasi Device Harus di Isi !')"
                                   oninput="setCustomValidity('')" placeholder="ex: Ruang Core server">
                            <?php echo form_error('lokasi', '<div class="text-red">', '</div>'); ?>                            
                        </div> 
                        <div class="form-group">
                            <label>Tgl. Inventaris</label>
                            <div class="input-group">
                              <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </div>                              
                                 <input type="text" name="tgl_inv" class="form-control datepicker" data-date-format="yyyy-mm-dd" required oninvalid="setCustomValidity('Tgl. Inventaris harus di isi')"
                                   oninput="setCustomValidity('')" placeholder="yyyy-mm-dd" >                            
                            </div><!-- /.input group -->
                        </div>   
                                            
                    </div><!-- /.box-body -->

                    <div class="box-footer">
                        <button type="submit" name="submit" class="btn btn-primary"><i class="glyphicon glyphicon-hdd"></i> Simpan</button>                        
                        <a href="javascript:history.back()" class="btn btn-primary">Kembali</a>
                    </div>
                </form>
                </div>
            </div>
            </div>
        </div>
    </div>
</section>
