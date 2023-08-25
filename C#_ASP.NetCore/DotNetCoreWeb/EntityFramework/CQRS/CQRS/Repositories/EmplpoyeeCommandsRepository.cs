﻿using CQRS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CQRS.Repositories
{
    public class EmployeeCommandsRepository : IEmployeeCommandsRepository
    {
        public void SaveEmployee(Employee employee)
        {
            // Persist the employee record in a data store
        }
    }
}