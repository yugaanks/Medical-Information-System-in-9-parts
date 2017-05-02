package edu.stevens.cs548.clinic.service.ejb;

import java.util.List;

import edu.stevens.cs548.clinic.domain.Treatment;
import edu.stevens.cs548.clinic.domain.IProviderDAO.ProviderExn;
import edu.stevens.cs548.clinic.service.dto.ProviderDto;
import edu.stevens.cs548.clinic.service.dto.TreatmentDto;

public interface IProviderService {

	public class ProviderServiceExn extends Exception {
		private static final long serialVersionUID = 1L;

		public ProviderServiceExn(String m) {
			super(m);
		}
	}

	public class ProviderNotFoundExn extends ProviderServiceExn {
		private static final long serialVersionUID = 1L;

		public ProviderNotFoundExn(String m) {
			super(m);
		}
	}

	public class TreatmentNotFoundExn extends ProviderServiceExn {
		private static final long serialVersionUID = 1L;

		public TreatmentNotFoundExn(String m) {
			super(m);
		}
	}

	public long addProvider(ProviderDto dto) throws ProviderServiceExn;

	public ProviderDto getProvider(long id) throws ProviderServiceExn;

	public ProviderDto getProviderByProId(long pid) throws ProviderServiceExn;

	public long addTreatment(TreatmentDto tdto) throws ProviderServiceExn;

	public void deleteProvider();

	public String siteInfoPro();

	public List<Treatment> getTreatments(long id) throws ProviderExn;

	public TreatmentDto getTreatment(long id, long tid) throws TreatmentNotFoundExn, ProviderServiceExn;

}
