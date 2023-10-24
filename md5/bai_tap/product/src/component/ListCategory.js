import {useEffect, useState} from "react";
import * as category_service from "../service/category_service"

export function ListCategory() {
    const [categories, setCategories] = useState([])
    useEffect(() => {
            const findAllCategories = async () => {
                const result = await category_service.findAllCategories()
                setCategories(result)
            }
            findAllCategories()
        },[])
}