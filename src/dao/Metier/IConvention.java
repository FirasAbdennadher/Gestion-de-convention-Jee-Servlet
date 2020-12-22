package dao.Metier;

import java.util.List;

import entities.Convention;
import entities.User;



public interface IConvention {
    void addConvention(Convention c);

    void editConvention(Convention c);

    void deleteConvention(int id);
    List<Convention> getAllConvention();
    Convention getConvention(int id);
    List<Convention> getAllConventionParMotCle(String mc);
    
   // int getNumberConvention();

}
