--# -path=.:../Ground:../lexicon

concrete Quant1Sage of Quant1 = GroundSage **
open
	mySage,
	myFormal,
	Prelude in 
{
oper
        delimited_Quant1 : Str -> SS -> SS -> SS -> TermPrec =
		\com,vars,set,prop -> mkPrec highest (com  ++ "( ForSet (" ++ set.s ++ ", [" ++ vars.s ++ "] ), lambda" 
							++ "("  ++ vars.s ++ ")" ++ ":" ++ prop.s ++ ")[0] == True" ) ;

lin
	forall vs 		 =  variants{} ;                       					--  not defined
	forall_set vars set prop = mkProp ( delimited_Quant1 "forall" vars set prop ) ;			-- for continuous sets, it does not work
	exist vars set prop 	 = mkProp  ( delimited_Quant1 "exists"  vars set prop );    		-- for continuous sets, it does not work  	
}

-- [(x1,...xn) for x1 in C ... for xn in C] is generated by the command ForSet defined in prelude.sage