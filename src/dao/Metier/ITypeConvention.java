package dao.Metier;

import java.util.List;

import entities.Participant;
import entities.TypeConvention;
import entities.User;



public interface ITypeConvention {
    void addType(TypeConvention t);

    void editType(TypeConvention t);

    void deleteType(int id);
    List<TypeConvention> getAllType();
    TypeConvention getType(int id);

}
