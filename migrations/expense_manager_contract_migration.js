const expenseManagerContract=artifacts.require("ExpenseManagerContract");

module.exports=function (deployer){
    deployer.deploy(expenseManagerContract);
}