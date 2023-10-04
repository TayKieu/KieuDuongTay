import axios from "axios";

export const findAll = async () => {
    try {
        const result = await axios.get(' http://localhost:8080/books')
        return result.data
    } catch (e) {
        console.log(e)
    }
}

export const save = async (book)=>{
    try{
         await axios.post(' http://localhost:8080/books',book)
    }catch (e){
        console.log(e)}
}

export const findById = async (id) =>{
    try{
        const  result = await axios.get(' http://localhost:8080/books/' + id)
        return result.data
    }catch (e){
        console.log(e)}
}
export const edit = async (id, bookEdit) =>{
    try{
         await axios.put(' http://localhost:8080/books/' + id, bookEdit)
    }catch (e){
        console.log(e)}
}