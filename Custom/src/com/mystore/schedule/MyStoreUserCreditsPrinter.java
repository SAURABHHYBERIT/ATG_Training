package com.mystore.schedule;

import atg.nucleus.GenericService;
import atg.nucleus.ServiceException;
import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryView;
import atg.repository.rql.RqlStatement;
import atg.service.scheduler.Schedulable;
import atg.service.scheduler.Schedule;
import atg.service.scheduler.ScheduledJob;
import atg.service.scheduler.Scheduler;

public class MyStoreUserCreditsPrinter extends GenericService implements
		Schedulable {

	private Repository profileRepository;
	private Scheduler scheduler;
	private Schedule schedule;
	int jobId;

	public Scheduler getScheduler() {
		return scheduler;
	}

	public void setScheduler(Scheduler scheduler) {
		this.scheduler = scheduler;
	}

	public Schedule getSchedule() {
		return schedule;
	}

	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}

	public Repository getProfileRepository() {
		return profileRepository;
	}

	public void setProfileRepository(Repository profileRepository) {
		this.profileRepository = profileRepository;
	}

	@Override
	public void performScheduledTask(Scheduler arg0, ScheduledJob arg1) {
		RepositoryView userView;
		try {
			userView = getProfileRepository().getView("user");
			RqlStatement rql = RqlStatement.parseRqlStatement("ALL");
			Object[] param = new Object[1];
			param[0] = "ALL";
			RepositoryItem[] items;
			items = rql.executeQuery(userView, param);
			for (RepositoryItem user : items) {
				Double userDebt = (Double) user.getPropertyValue("spentCredit");
				String login = (String) user.getPropertyValue("login");
				if(userDebt != null){
					if(userDebt != 0.0){
						logInfo("User " + login + " ows " + userDebt + " moneys ^__^");					
					}							
				}
			}

		} catch (RepositoryException e) {
			logError("Error getting all users", e);
		}
	}

	public void doStartService() throws ServiceException {
		ScheduledJob job = new ScheduledJob("Debts", "Prints users debts",
				getAbsoluteName(), getSchedule(), this,
				ScheduledJob.SEPARATE_THREAD);
		jobId = getScheduler().addScheduledJob(job);
	}

	public void doStopService() throws ServiceException {
		getScheduler().removeScheduledJob(jobId);
	}

}
