package codegym.demo.validate;

import codegym.demo.entity.Product;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class ObjectValidate implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return Product.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        if (!(target instanceof Product)) {
            return;
        }
        Product instance = (Product) target;
//        if (instance.getPhone().length() != 10) {
//            errors.rejectValue("phone", "phonenumber", new String[]{"10"}, "Phone is not valid");
//        } else if (!instance.getPhone().startsWith("0")) {
//            errors.rejectValue("phone", "phonenumberstart", "Phone is not valid");
//        }
//        if (!instance.getEmail().matches("[A-Za-z0-9._%]+@[A-Za-z0-9.-]+.[A-Za-z]{2,4}")){
//            errors.rejectValue("email","email valid","Email is not valid");
//        }
//        if (!instance.getTotalBill().matches("[0-9]+")){
//            errors.rejectValue("totalBill","number error","Must be number");
//        }
    }
}
