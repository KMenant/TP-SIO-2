/* This file is part of the db4o object database http://www.db4o.com

Copyright (C) 2004 - 2011  Versant Corporation http://www.versant.com

db4o is free software; you can redistribute it and/or modify it under
the terms of version 3 of the GNU General Public License as published
by the Free Software Foundation.

db4o is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License along
with this program.  If not, see http://www.gnu.org/licenses/. */
package EDU.purdue.cs.bloat.tree;

/**
 * ExprStmt is a statement consisting of an expression.
 * 
 * @see Expr
 */
public class ExprStmt extends Stmt {
	Expr expr; // Expression contained in this statement

	/**
	 * Constructor.
	 * 
	 * @param expr
	 *            The expression contained in this statement.
	 */
	public ExprStmt(final Expr expr) {
		this.expr = expr;
		expr.setParent(this);
	}

	public Expr expr() {
		return expr;
	}

	public void visitForceChildren(final TreeVisitor visitor) {
		expr.visit(visitor);
	}

	public void visit(final TreeVisitor visitor) {
		visitor.visitExprStmt(this);
	}

	public Object clone() {
		return copyInto(new ExprStmt((Expr) expr.clone()));
	}
}
