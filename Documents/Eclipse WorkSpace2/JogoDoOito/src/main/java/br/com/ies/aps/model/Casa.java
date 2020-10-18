package br.com.ies.aps.model;

public class Casa {

	private Integer linha;
	private Integer coluna;

	private Casa(Builder builder) {
		this.linha = builder.linha;
		this.coluna = builder.coluna;
	}
	
	public Integer getLinha() {
		return linha;
	}

	public Casa setLinha(Integer linha) {
		this.linha = linha;
		return this;
	}

	public Integer getColuna() {
		return coluna;
	}

	public Casa setColuna(Integer coluna) {
		this.coluna = coluna;
		return this;
	}
	
	@Override
	public String toString() {
		return "Casa [linha=" + linha + ", coluna=" + coluna + "]";
	}
	@Override
	public boolean equals(Object obj) {
		return ((Casa)obj).getColuna() == this.getColuna() 
				&&	((Casa)obj).getLinha() == this.getLinha();
	}


	public static class Builder{
		
		private Integer linha;
		private Integer coluna;
		
		public Builder() {
		}
		
		public Builder withLinha(Integer linha) {
			this.linha = linha;
			return this;
		}
		
		public Builder withColuna(Integer coluna) {
			this.coluna = coluna;
			return this;
		}
		
		public Casa build() {
			return new Casa(this);
		}
	}

}
