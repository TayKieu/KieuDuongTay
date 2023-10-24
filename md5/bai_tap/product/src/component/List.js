import * as product_service from "../service/product_service"
import {useEffect, useState} from "react";
import {Paginate} from "./Paginate";
export function List() {
    const [products, setProducts] = useState([])

    useEffect(() => {
            const fetchApi = async () => {
                const result = await product_service.findAll()
                setProducts(result)
            }
            fetchApi()
    }, []);
    return (
        <>
            <Paginate data={products}></Paginate>
        </>
    )
}