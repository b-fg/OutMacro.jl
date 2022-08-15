using Out, Test

@testset "Output matrix by lines" begin
    let fname = tempname()
        try
            open(fname, "w") do fout
                redirect_stdout(fout) do
                    @out zeros(2, 2)
                end
            end
            str = read(fname, String)
            @test str == "zeros(2, 2) = 2×2 Matrix{Float64}:\n 0.0  0.0\n 0.0  0.0\n"
        finally
            rm(fname, force=true)
        end
    end
end

@testset "Output a vector" begin
    a = [1, 2, 3, 4]
    @out a
    @test true
end

@testset "Output multiple vectors" begin
    a = [1, 2, 3, 4]
    b = [5.0, 6.0]
    @out(a, b)
    @test true
end

@testset "Output a matrix" begin
    a = [1 2; 3 4]
    @out a
    @test true
end