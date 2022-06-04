const boom = require('@hapi/boom');
const { VAR_STRING } = require('mysql/lib/protocol/constants/types');


function validatorHandler(schema,property){
    return(req,res,next)=>{
        const data =req[property];
        const {error} = schema.validate(data,{abortEarly:false});
        if(error){
            next(boom.badRequest(error));
        }
        next();
    }
}

module.exports = validatorHandler;