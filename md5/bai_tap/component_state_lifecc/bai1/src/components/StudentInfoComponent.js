import {Component} from "react";

class StudentInfoComponent extends Component {
    constructor(props) {
        super(props);
        this.state = {
            students: [
                {
                    id: 1,
                    name: 'Tay',
                    address: 'TCV',
                    age: 19
                },
                {
                    id: 2,
                    name: 'Tan',
                    address: 'Da nang',
                    age: 30
                },
                {
                    id: 3,
                    name: 'Teo',
                    address: 'Da nang',
                    age: 20
                }
            ]
        }
    }

    render() {
        return (
            <div>
                <table border={1}>
                    <tr>
                        <td>Id</td>
                        <td>Name</td>
                        <td>Address</td>
                        <td>Age</td>
                    </tr>
                    {this.state.students.map(student =>(
                        <tr>
                            <td>{student.id}</td>
                            <td>{student.name}</td>
                            <td>{student.address}</td>
                            <td>{student.age}</td>
                        </tr>
                    ))}
                </table>
            </div>
        )
    }

}
export default StudentInfoComponent