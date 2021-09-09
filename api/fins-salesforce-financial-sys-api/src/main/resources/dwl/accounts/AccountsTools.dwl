/**
 * THis module provides utility functions and mappings for FINS Account transformations
 */

%dw 2.0

/**
 * This map is used by the conversion functions below.
 */
var sfAccountTypeMap = {
	"Checking": "CheckingAccount",
	"Credit Card": "CreditCardAccount",
	"Personal Loan": "LoanAccount",
	"Savings": "SavingsAccount"
}
/**
 * Maps from SF FinancialAccount FinancialAccountType to a FINS Account child type
 * @return FINS Account Type
 */
fun sfAccountTypeToFins(sfAccountType) = sfAccountTypeMap[(sfAccountType)] default "CheckingAccount"

/**
 * This map is used by the conversion function below.
 */
var finsAccountTypeMap = sfAccountTypeMap mapObject ({ ($):$$ }) //swap values and keys
/**
 * Map from FINS Account Subtype to a SF FinancialAccount FinancialAccountType
 * @return SF FinancialAccountType
 */
fun finsAccountTypeToSf(finsAccountType) = finsAccountTypeMap[(finsAccountType)] default "Other"

/**
 * This map is used by the conversion function below.
 */
var sfAccountStatusMap = {
	"Closed": "CLOSED",
	"On Hold": "ON_HOLD",
	"Open": "OPEN",
	"Pending": "PENDING"
}
/**
 * Maps from SF FinancialAccount Status to a FINS Account Status enum
 * @return FINS Transaction Subtype (enum)
 */
fun sfAccountStatusToFins(sfAccountStatus) = sfAccountStatusMap[(sfAccountStatus)] default "OPEN"

/**
 * This map is used by the conversion function below.
 */
var finsAccountStatusMap = sfAccountStatusMap mapObject ({ ($):$$ }) //swap values and keys
/**
 * Map from FINS Account Status to a SF FinancialAccount Status
 * @return SF FinancialAccountType
 */
fun finsAccountStatusToSf(finsAccountStatus) = finsAccountStatusMap[(finsAccountStatus)] default "Open"

/**
 * This map is used by the conversion function below.
 */
var sfTransactionTypeMap = {
	"Credit": "CreditTransaction",
	"Debit": "DebitTransaction"
}
/**
 * Maps from SF FinancialAccountTransaction TransactionType to a FINS Transaction child type
 * @return FINS Transaction Type (RAML type)
 */
fun sfTransactionTypeToFins(sfTransactionType) = sfTransactionTypeMap[(sfTransactionType)] default "CreditTransaction"


var cimTransactionTypeMap = {
	"CreditTransaction": "Credit",
	 "DebitTransaction": "Debit"
}
/**
 * Maps from CIM FinancialAccountTransaction TransactionType to a SF Transaction child type
 * @return CIM Transaction Type (SF type)
 */
fun cimTransactionTypeToSF(sfTransactionType) = cimTransactionTypeMap[(sfTransactionType)] default "Credit"
/**
 * This map is used by the conversion function below.
 */
var sfTransactionSubtypeMap = {
	"Cash Deposit": "CASH",
	"On-Us Check Deposit": "CHECK",
	"Transit Check Deposit": "CHECK",
	"Foreign Cash Deposit": "CASH",
	"Bill Payment": "PAYMENT",
	"EFT": "TRANSFER",
	"ATM Deposit": "ATM",
	"ATM Withdrawal": "ATM",
	"POS withdrawal": "POS",
	"Misc. Credit": "MISC",
	"Misc. Debit": "MISC",
	"Loan Payment": "PAYMENT",
	"Mortgage Payment": "PAYMENT",
	"Credit Card Payment": "PAYMENT",
	"Credit Card Cash Advance": "CARD",
	"Internal Funds Transfer": "TRANSFER",
	"Reversal": "MISC",
	"Interest Earned": "INTEREST",
	"Fee": "FEE",
	"Merchant Charge": "FEE"
}

var cimTransactionSubtypeMap = {
	"CASH":"Cash Deposit",
	"CHECK": "On-Us Check Deposit",
	"PAYMENT" : "Bill Payment",
	"TRANSFER": "EFT",
	"ATM": "ATM Withdrawal",
	//"ATM": "ATM Deposit",
	"POS": "POS withdrawal",
	"MISC" : "Misc. Credit",
	//"MISC": "Misc. Debit",
	//"PAYMENT": "Loan Payment",
	"CARD": "Credit Card Cash Advance",
	//"TRANSFER": "Internal Funds Transfer",
	//"MISC" : "Reversal",
	"INTEREST": "Interest Earned",
	"FEE": "Fee"
}
/**
 * Maps from SF FinancialAccountTransaction TransactionSubType to a FINS TransactionSubtype enum
 * @return FINS Transaction Subtype (enum)
 */
fun sfTransactionSubtypeToFins(sfTransactionSubtype) = sfTransactionSubtypeMap[(sfTransactionSubtype)] default "MISC"

fun cimTransactionSubtypeToSF(sfTransactionSubtype) = cimTransactionSubtypeMap[(sfTransactionSubtype)] default "Fee"

/**
 * This map is used by the conversion function below.
 */
var sfTransactionStatusMap = {
	"Pending": "PENDING",
	"Posted": "POSTED",
	"Hold": "HOLD",
	"Cleared": "CLEARED"
}
/**
 * Maps from SF FinancialAccountTransaction TransactionStatus to a FINS TransactionStatus enum
 * @return FINS Transaction Type
 */
fun sfTransactionStatusToFins(sfTransactionStatus) = sfTransactionStatusMap[(sfTransactionStatus)] default "PENDING"
var cimTransactionStatusMap = {
	"PENDING": "Pending",
	"POSTED": "Posted" ,
	"HOLD": "Hold",
	"CLEARED": "Cleared"
}
fun cimTransactionStatusToSF(sfTransactionStatus) = cimTransactionStatusMap[(sfTransactionStatus)] default "Pending"

/**
 * This map is used by the conversion function below.
 */
var sfTransactionDisputedReasonMap = {
	"Duplicate Transactions": "DUPLICATE",
	"Transaction not recognized": "UNRECOGNIZED",
	"Suspected Fraud": "FRAUD",
	"Others": "OTHER"
}
/**
 * Maps from SF FinancialAccountTransaction TransactionDisputedReason to a FINS TransactionDisputedReason enum
 * @return FINS Transaction Type
 */
fun sfTransactionDisputedReasonToFins(sfTransactionDisputedReason) = sfTransactionDisputedReasonMap[(sfTransactionDisputedReason)] default "OTHER"
var finsTransactionDisputedReasonMap = sfTransactionDisputedReasonMap mapObject ({ ($):$$ }) //swap values and keys
/**
 * Maps from a FINS TransactionDisputedReason enum to SF FinancialAccountTransaction TransactionDisputedReason
 * @return SF Transaction Type
 */
fun finsTransactionDisputedReasonToSf(finsTransactionDisputedReason) = finsTransactionDisputedReasonMap[(finsTransactionDisputedReason)] default "Others"
/**
 * Formats a given SF datetime to a canonical datetime
 */
fun getFormattedDateTime(datetimeToFormat) = (datetimeToFormat as DateTime {format: "yyyy-MM-dd'T'HH:mm:ss.SSSz"} default now()) as String {format: "yyyy-MM-dd'T'HH:mm:ssz"}
