module test_stdlibs

using Stdlibs
using .Stdlibs.Test # @testset @test

@testset "test parentmodule" begin
    @test parentmodule(Stdlibs.Test) !== Stdlibs
end

pkg = Base.PkgId(Base.UUID("44cfe95a-1eb2-52ea-b672-e2afdf69b78f"), "Pkg")
loaded = Base.loaded_modules[pkg]
using .loaded

if VERSION >= v"1.4.0-DEV"
    @testset "test artifacts" begin
        @test loaded.Artifacts isa Module
    end
end

end # module test_stdlibs
