# bankaccount-patch
This transformation produces an Update SF FinancialAccount from a FIS Account. The FIS Id is replaced with a SF Id.

# bankaccount-post
This transformation produces a Create SF FinancialAccount from a FIS Account. The FIS Id is moved to externalIds.

# customers-post
This transformation produces a Create SF Person Account from a FIS Customer. The FIS Id is moved to externalIds.

# customers-patch
This transformation produces an Update SF Person Account from a FIS Customer. TThe FIS Id is replaced with a SF Id.

# transaction-patch
This transformation produces an Update SF FinancialAccountTransaction from a FIS Transaction. The FIS Id is replaced with a SF Id.

# transaction-post
This transformation produces a Create SF FinancialAccountTransaction from a FIS Customer. The FIS Id is moved to externalIds.

