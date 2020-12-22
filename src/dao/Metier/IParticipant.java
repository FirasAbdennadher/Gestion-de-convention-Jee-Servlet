package dao.Metier;

import java.util.List;

import entities.Participant;
import entities.ParticipantConvention;
import entities.User;



public interface IParticipant {
    void addParticipant(Participant p);

    void editParticipant(Participant p);

    void deleteParticipant(int id);
    List<Participant> getAllParticipant();
    Participant getParticipant(int id);
    List<Participant> getAllParticipantParMotCle(String mc);

}
