<?php

/**
 * Carga del modelo Menus...
 */
Load::models('pagodetalle');

class PagodetalleController extends AppController {

    /**
     * Obtiene una lista para paginar los menus
     */
    public function index($page = 1) {
        $pagodetalle = new Pagodetalle();
        $this->listPagodetalle = $pagodetalle->getpagodetalle($page);
    }

    /**
     * Crea un Registro
     */
    public function create() {
       // print_r($_POST);exit();
        /**
         * Se verifica si el usuario envio el form (submit) y si ademas 
         * dentro del array POST existe uno llamado "menus"
         * el cual aplica la autocarga de objeto para guardar los 
         * datos enviado por POST utilizando autocarga de objeto
         */
        if (Input::hasPost('pagodetalle')) {
            /**
             * se le pasa al modelo por constructor los datos del form y ActiveRecord recoge esos datos
             * y los asocia al campo correspondiente siempre y cuando se utilice la convención
             * model.campo
             */
            $pagodetalle = new Pagodetalle(Input::post('pagodetalle'));
            //En caso que falle la operación de guardar
            if ($pagodetalle->create()) {
                Flash::valid('Operación exitosa');
                //Eliminamos el POST, si no queremos que se vean en el form
                Input::delete();
                return;
            } else {
                Flash::error('Falló Operación');
            }
        }
    }

    /**
     * Edita un Registro
     *
     * @param int $id (requerido)
     */
    public function edit($id) {
        $pagodetalle= new Pagodetalle();

        //se verifica si se ha enviado el formulario (submit)
        if (Input::hasPost('pago')) {

            if ($pagodetalle->update(Input::post('pagodetalle'))) {
                Flash::valid('Operación exitosa');
                //enrutando por defecto al index del controller
                return Router::redirect();
            } else {
                Flash::error('Falló Operación');
            }
        } else {
            //Aplicando la autocarga de objeto, para comenzar la edición
            $this->pagodetalle = $pagodetalle->find_by_id((int) $id);
        }
    }

    /**
     * Eliminar un menu
     * 
     * @param int $id (requerido)
     */
    public function del($id) {
        $pagodetalle = new Pagodetalle();
        if ($pagodetalle->delete((int) $id)) {
            Flash::valid('Operación exitosa');
        } else {
            Flash::error('Falló Operación');
        }

        //enrutando por defecto al index del controller
        return Router::redirect();
    }

}