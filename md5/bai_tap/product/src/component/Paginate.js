import {useEffect, useState} from "react";
import ReactPaginate from "react-paginate";
import {toast, ToastContainer} from "react-toastify";
import {NavLink} from "react-router-dom";
import * as product_service from "../service/product_service";
import * as category_service from "../service/category_service";

export function Paginate(props) {
    const [key, setKey] = useState('')
    const {data} = props
    console.log(data)
    const [currentItems, setCurrentItems] = useState([])
    // const [pageCount, setPageCount] = useState(0)
    // const [itemOffset, setItemOffset] = useState(0)



    const [currentPage,setCurrentPage]=useState(1)
    const recordsPerPage = 3
    const lastIndex = currentPage * recordsPerPage
    const firstIndex = lastIndex - recordsPerPage
    const records = data.slice(firstIndex,lastIndex)
    const npage = Math.ceil(data.length/recordsPerPage)
    const numbers = [...Array(npage + 1).keys()].slice(1)


    // const itemsPerPage = 2
    //Category
    const [categories, setCategories] = useState([])
    useEffect(() => {
        // const endOffset = itemOffset + itemsPerPage
        // if (key === "") {
        //     setCurrentItems(records)
        // }
        // setPageCount(Math.ceil(data.length / itemsPerPage))

        const fetchApi = async () => {
            const result = await category_service.findAllCategories()
            setCategories(result)
        }
        fetchApi()
    },[data,key])
    // }, [itemOffset, itemsPerPage, data, key])

    // const handlePageClick = (event) => {
    //     const newOffset = (event.selected + itemsPerPage) % data.length
    //     setItemOffset(newOffset)
    // }
    const handleDelete = async (id) => {
        await product_service.deleteById(id)
        setCurrentItems((prevProduct) => prevProduct.filter((product) => product.id !== id));
        toast('🦄 Delete book successfully!!!!');
    }
    const changeSearch = (event) => {
        setKey(event.target.value)
    }
    const handleSearch = () => {
        const params = {
            key: key
        }
        const fetchApi = async () => {
            const result = await product_service.findByKey(params.key)
            setCurrentItems(result)
        }
        fetchApi()
    }
    const prePage = () =>{
        if(currentPage !== firstIndex){
            setCurrentPage(currentPage-1)
        }
    }
    const changePage = (id) =>{
        setCurrentPage(id)
    }
    const nextPage = () =>{
        if(currentPage !== lastIndex){
            setCurrentPage(currentPage+1)
        }
    }
    return (
        <>
            <div>
                <h1>Product list</h1>
                <div>
                    <div>
                        <input type="search"
                               id="form1"
                               value={key}
                               onChange={changeSearch}
                        />
                        <button className="btn btn-success" onClick={handleSearch}>Find</button>
                    </div>

                </div>
                <div>
                    <ToastContainer/>
                </div>
                <NavLink to='/create' className='btn btn-success'>Add new product</NavLink>
                <table className='table'>
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    {records.map((p) => (
                        <tr>
                            <td>{p.name}</td>
                            <td>{p.quantity}</td>
                            <td>{p.description}</td>
                            <td>{p.price}</td>
                            <td>{
                                categories.find(category => String(category.id) === String(p.category))?.name
                            }</td>
                            <td>
                                <NavLink to={`/update/${p.id}`} className='btn btn-primary'>Edit</NavLink>
                                <button className="btn btn-danger"
                                        onClick={(e) => handleDelete(p.id)}>Delete
                                </button>

                            </td>
                        </tr>
                    ))}
                    </tbody>
                </table>
            </div>
            {/*<ReactPaginate*/}
            {/*    breakLabel="..."*/}
            {/*    nextLabel="next >"*/}
            {/*    onPageChange={handlePageClick}*/}
            {/*    pageRangeDisplayed={2}*/}
            {/*    pageCount={pageCount}*/}
            {/*    previousLabel="< previous"*/}
            {/*    pageClassName="page-item"*/}
            {/*    pageLinkClassName="page-link"*/}
            {/*    previousClassName="page-item"*/}
            {/*    previousLinkClassName="page-link"*/}
            {/*    nextClassName="page-item"*/}
            {/*    nextLinkClassName="page-link"*/}
            {/*    breakClassName="page-item"*/}
            {/*    breakLinkClassName="page-link"*/}
            {/*    containerClassName="pagination"*/}
            {/*    activeClassName="active"*/}
            {/*/>*/}
            <nav>
                <ul className='pagination'>
                    <li className='page-item'>
                        <a href='#' className='page-link' onClick={prePage}>Prev</a>
                    </li>
                    {numbers.map((n,i)=>(
                        <li className={`page-item ${currentPage === n ? 'active':''}`} key={i}>
                            <a href='#' className='page-link'
                            onClick={()=>changePage(n)}>{n}</a>
                        </li>
                    ))}
                    <li className='page-item'>
                        <a href='#' className='page-link' onClick={nextPage}>Next</a>
                    </li>
                </ul>
            </nav></>

    )
}