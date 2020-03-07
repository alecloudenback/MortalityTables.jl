
@testset "basic `Ultimate` MortalityTable" begin

    u1 = UltimateMortality([i for i in 1:20],0)
    @test q(u1,0,1) == 1
    @test q(u1,0,2) == 2
    @test q(u1,0,1:2) == [1,2]
    @test q(u1,1,1) == 2
    @test ω(u1,0) == 19

    u2 = UltimateMortality([i for i in 1:10],5)
    @test ismissing(q(u2,4,1))
    @test q(u2,5,1) == 1

    s = [ia + d for ia in 0:5, d in 1:5]

    s1 = SelectMortality(s,u1,0)
    @test q(s1,0,1) == 1
    @test q(s1,0,1:2) == [1,2]
    @test ω(s1,0) == 19
    @test q(s1,0,20) == 20

    mt1 = MortalityTable(s1,u1,TableMetaData())

    q(mt1.select,0,1) == 1
    q(mt1.ultimate,0,1) == 1

end
