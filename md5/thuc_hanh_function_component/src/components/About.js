import {useParams} from "react-router-dom";


function About() {
    let { categoryId } = useParams();
    return (
        <div>
            <h3>Id selected {categoryId} </h3>
        </div>
    );
}
export default About;