# spec/simulador_fila_spec.rb

require "organizador_fila_atendimento_gem"

RSpec.describe OrganizadorFilaAtendimentoGem::SimuladorFila do
  let(:simulador) { described_class.new }

  describe "#adicionar_cliente" do
    it "adiciona um cliente à fila" do
      expect { simulador.adicionar_cliente(5) }.to change { simulador.instance_variable_get(:@fila).size }.from(0).to(1)
    end
  end

  describe "#processar_atendimento" do
    it "remove o cliente da fila e calcula o tempo de espera" do
      simulador.adicionar_cliente(5)
      expect { simulador.processar_atendimento(10) }.to output("Cliente atendido após 5 unidades de tempo.\n").to_stdout
    end
  end

  describe "#tempo_chegada_cliente" do
    it "gera um tempo de chegada de cliente entre 1 e 10 minutos" do
      tempo_chegada = simulador.tempo_chegada_cliente
      expect(tempo_chegada).to be_between(1, 10)
    end
  end

  describe "#tempo_atendimento" do
    it "gera um tempo de atendimento entre 5 e 20 minutos" do
      tempo_atendimento = simulador.tempo_atendimento
      expect(tempo_atendimento).to be_between(5, 20)
    end
  end

  describe "#tempo_medio_espera" do
    it "calcula corretamente o tempo médio de espera" do
      simulador.adicionar_cliente(5)
      simulador.adicionar_cliente(10)
      expect(simulador.tempo_medio_espera).to eq(7.5)
    end
  end

  describe "#tempo_medio_sistema" do
    it "calcula corretamente o tempo médio no sistema" do
      simulador.adicionar_cliente(5)
      simulador.adicionar_cliente(10)
      expect(simulador.tempo_medio_sistema).to eq(9.0)
    end
  end

  describe "#taxa_ocupacao_servidor" do
    it "calcula corretamente a taxa de ocupação do servidor" do
      expect(simulador.taxa_ocupacao_servidor(100)).to eq(100.0)
    end
  end
end
