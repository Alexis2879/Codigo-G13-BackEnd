import axios from 'axios';

const API_URL ="http://localhost:5000/"

class AuthService {
    login(usuario,password){
        return axios
        .post (API_URL + "auth",{
            usuario,
            password
        })
        .then(res=>{
            if(res.data.comtent){
                localStorage.setItem("token",JSON.stringify(res.data.content));
            }

            return res.data;
        })
    }
}

export default new AuthService();
