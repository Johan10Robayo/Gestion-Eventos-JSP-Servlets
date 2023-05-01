function Registrar() {


console.log("holi");
    nombresapel = document.getElementById('nombresapel').value;
    correo = document.getElementById('correo').value;
    numdocu = document.getElementById('numdocu').value;
    celular = document.getElementById('celular').value;
    user = document.getElementById('user').value;
    passregistro = document.getElementById('passregistro').value;

    exp_nombresapel = /^[a-zA-ZÀ-ÿ\s]{3,25}$/;
   // exp_correo = /^[a-zA-Z0-9.!#$%&'*+=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)(.){1}+[a-zA-Z0-9-]*$/;
    exp_correo = /^[a-zA-ZÀ-ÿ0-9_.-]+@[a-zA-Z-]+\.[a-zA-Z0-9-.]+$/;
    exp_numdocu = /^[0-9]{7,14}$/;
    exp_celular = /^[0-9]{7,14}$/;
    exp_user = /^([a-zA-Z0-9(_)(-)(.)]){4,25}$/;
    exp_passregistro = /^[a-zA-Z0-9\.]{3,15}[^\s]$/;

    verificar_nombresapel = exp_nombresapel.test(nombresapel);
    verificar_correo = exp_correo.test(correo);
    verificar_numdocu = exp_numdocu.test(numdocu);
    verificar_celular = exp_celular.test(celular);
    verificar_user = exp_user.test(user);
    verificar_passregistro = exp_passregistro.test(passregistro);

    if (verificar_nombresapel === false) {
        alert('Los nombres deben tener un tamaño de 3 a 25 caracteres, no deben incluir caracteres especiales ni digitos.');
        return false;
    }

    if (verificar_correo === false) {
        alert('El email debe seguir la siguiente estructura: usuario@dominio');
        return false;
    }

    if (verificar_numdocu === false) {
        alert('El número de documento debe de tener de 7 a 14 digitos');
        return false;
    }

    if (verificar_celular === false) {
        alert('El número de celular debe de tener de 7 a 14 digitos');
        return false;
    }

    if (verificar_user === false) {
        alert('El usuario debe tener caracteres en letras mayúsculas o minúsculas; el guíon bajo, alto y los números son opcionales. Tamaño de 4 a 25 caracteres.');
        return false;
    }

    if (verificar_passregistro === false) {
        alert('La contraseña debe tener un tamaño de 8 a 15 caracteres');
        return false;
    }

}

 function Login() {

        usuariologin = document.getElementById('usuario').value;
        passlogin = document.getElementById('passlogin').value;

        exp_usuariologin = /^([a-zA-Z0-9(_)(-)(.)]){4,25}$/;
        exp_passlogin = /^[a-zA-Z0-9\.]{3,15}[^\s]$/;

        verificar_usuariologin = exp_usuariologin.test(usuariologin);
        verificar_passlogin = exp_passlogin.test(passlogin);

        if (verificar_usuariologin === false) {
            alert('El usuario debe tener caracteres en letras mayúsculas o minúsculas; el guíon bajo, alto y los números son opcionales. Tamaño de 4 a 16 caracteres.');
            return false;
        }

        if (verificar_passlogin === false) {
            alert('La contraseña debe tener un tamaño de 8 a 15 caracteres');
            return false;
        }
    }


