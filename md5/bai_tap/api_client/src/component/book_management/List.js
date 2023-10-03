import * as bm_service from "../../service/Book_management_service"
import {useEffect, useState} from "react";
import {Form} from "formik";
import {NavLink} from "react-router-dom";

export function List() {
    const [books, setBooks] = useState([])
    useEffect(() => {
        const fetchApi = async () => {
            const result = await bm_service.findAll()
            setBooks(result)
        }
        fetchApi()
    }, [books]);
    return (
        <>
            <h1>Library</h1>
            <NavLink to='/create' className='btn btn-success'>Add new book</NavLink>
            <table className="table">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                {
                    books.map((b) =>(
                        <tr>
                            <td>{b.title}</td>
                            <td>{b.quantity}</td>
                            <td>
                                <NavLink to='/update/:id' className='btn btn-primary'>Edit</NavLink>
                                <NavLink to='/delete/:id' className='btn btn-danger'>Delete</NavLink>
                            </td>
                        </tr>
                    ))
                }
                </tbody>
            </table>
        </>
    )
}