package kr.or.pet.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.pet.model.dao.PetDao;
import kr.or.pet.model.vo.PetCheckList;
import kr.or.pet.model.vo.Pet;

@Service
public class PetService {
	@Autowired
	private PetDao dao;
	
	@Transactional
	public int insertPet(Pet p, PetCheckList petChk) {
		int result = dao.insertPet(p);
		if(result > 0) {
			petChk.setPetNo(p.getPetNo());
			result = dao.insertPetChk(petChk);			
			return result;
		}else {
			return result;
		}
	}

	public ArrayList<Pet> selectMyPet(int memberNo) {
		ArrayList<Pet> list = dao.selectMyPet(memberNo);
		return list;
	}

	public ArrayList<PetCheckList> selectMyPetChk(int memberNo) {
		ArrayList<PetCheckList> list = dao.selectMyPetChk(memberNo);
		return list;
	}

	public String selectPetName(int petNo) {
		return dao.selectPetName(petNo);
	}
	
}
