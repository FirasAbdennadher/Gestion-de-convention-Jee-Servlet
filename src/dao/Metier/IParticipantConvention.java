package dao.Metier;

import java.util.List;

import entities.Convention;
import entities.Participant;
import entities.ParticipantConvention;
import entities.User;



public interface IParticipantConvention {
    void addParticipantConvention(ParticipantConvention c);

    void editParticipantConvention(ParticipantConvention c);

    void deleteParticipantConvention(int id);
    void deleteParticipantConventionParConvention(int id);

    List<ParticipantConvention> getAllParticipantConvention();
    ParticipantConvention getParticipantConvention(int id);
    List<ParticipantConvention> getAllParticipantConventionParMotCle(String mc);
    List<ParticipantConvention> getAllParticipantParConvention(String id);
    List<ParticipantConvention> getAllConvntionParticipantParParticipant(String id);
    List<ParticipantConvention> getParticipantConventionParIDConvention(String id);
    List<Participant> getPariticpantNotInConvention(String id);



}
